%word = 'inane';
word = 'absurd';
%word = 'elated';
%word = 'tired';
%word = 'upset';
%word = 'examined';
%word = 'observed';
%word = 'shown';
word = user_word_prompt(names);

msgbox(similar_words_lookup(word, names, thesaurus_aligned),'Thesaurus')
msgbox(similar_words_lookup(word, names,  WD,   10), 'Embedding')


pause;

  allHandle = allchild(0);
  allTag = get(allHandle, 'Tag');
  isMsgbox = strncmp(allTag, 'Msgbox_', 7);
  delete(allHandle(isMsgbox));