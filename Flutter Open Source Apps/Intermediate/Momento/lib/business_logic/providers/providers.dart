import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/theme_manager.dart';
import 'package:momento/data/models/note.dart';
import 'package:momento/business_logic/providers/search_result.dart';
import 'package:momento/data/repositories/notes_repository.dart';
import 'package:momento/business_logic/providers/selected_notes.dart';

// The [NotesRepositoryProvider] provides an instance of [NotesRepository] class.
final NotesRepositoryProvider =
    ChangeNotifierProvider<NotesRepository>((ref) => NotesRepository());

// The [AllNotesProvider] fetches Notes List from [NotesRepository] class
// using the [NotesRepositoryProvider] and provides the Notes List.
// note: we use [FutureProvider] because =>
// 1. we need to await for getAllNotes() to be completed.
// 2. we get benifit of using .when() with [AsyncValue] , so we don't need [FutureBuilder]
final AllNotesProvider = FutureProvider<List<Note>>((ref) async {
  await ref.watch(NotesRepositoryProvider).getAllNotes();
  return ref.watch(NotesRepositoryProvider).notes_list ?? [];
});

final PinnedNotesProvider = FutureProvider<List<Note>>((ref) async {
  var notes = ref.watch(AllNotesProvider)?.data?.value;
  List<Note> pinnednotes = [];
  notes?.forEach((e) {
    if (e.isPinned == 1) pinnednotes.add(e);
  });
  return pinnednotes;
});

final UnPinnedNotesProvider = FutureProvider<List<Note>>((ref) async {
  var notes = ref.watch(AllNotesProvider)?.data?.value;
  List<Note> unpinnednotes = [];
  notes?.forEach((e) {
    if (e.isPinned == 0) unpinnednotes.add(e);
  });
  return unpinnednotes;
});

// The [NoteProvider] takes an index of the Note and fetches the Note
// from Note List Provided by [AllNotesProvider] class.
final NoteProvider = ChangeNotifierProvider.family<Note, int>((ref, id) {
  var notelist = ref.watch(AllNotesProvider)?.data?.value;
  ref.onDispose(() {
    print('note with id: ' + id.toString() + ' disposed');
  });
  return notelist?.firstWhere((element) => element.id == id);
});

// The [SelectedNotesProvider] provides SelectedNotes ChangeNotifier
// which we can listen to in order to get currently selected notes
final SelectedNotesProvider =
    ChangeNotifierProvider<SelectedNotes>((ref) => new SelectedNotes());

// The [SearchTextProvider] provides Search Text typed in the [SearchBar]
// which we can listen to in order to get current SearchText
final SearchTextProvider = StateProvider<String>((ref) {
  return "";
});

// The [SearchResultClassProvider] provides [SearchResult] instance.
// It Takes List of Notes from [AllNotesProvider] and
// The Search Text From [SearchTextProvider]
final SearchResultClassProvider = ChangeNotifierProvider<SearchResult>((ref) {
  var notelist = ref.watch(AllNotesProvider)?.data?.value;
  String str = ref.watch(SearchTextProvider).state;
  return SearchResult(notes: notelist, str: str);
});

// The [AllSearchResultProvider] provides List of Notes From [SearchResult]
final AllSearchResultProvider = FutureProvider<List<Note>>((ref) async {
  return ref.watch(SearchResultClassProvider).result_notes_list;
});

//final isNoteSelected = Provider.family<bool, int>((ref, noteId) {
//  return ref
//      .watch(SelectedNotesProvider)
//      .notes_list
//      .any((element) => element.id == noteId);
//});

/// isNoteEdited
ValueNotifier<bool> a = ValueNotifier<bool>(false);

final ThemeManagerProvider = ChangeNotifierProvider<ThemeManager>((ref){
  return ThemeManager();
});
