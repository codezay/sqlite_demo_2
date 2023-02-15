class Chord {
  int? id;
  String? title;
  String? lyrics;
  String? chords;
  String? key;
  String? chordsby;
  String? timestamp;
  int? bpm;
  String? notes;
  String? timesignature;
  String? rhythm;
  int? complexity;
  String? tags;
  int? rating;
  int? original;
  int? usagecount;
  String? category;
  String? additional;

  Chord({
    this.id,
    this.title,
    this.lyrics,
    this.chords,
    this.key,
    this.chordsby,
    this.timestamp,
    this.bpm,
    this.notes,
    this.timesignature,
    this.rhythm,
    this.complexity,
    this.tags,
    this.rating,
    this.original,
    this.usagecount,
    this.category,
    this.additional,
  });

  Chord.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    lyrics = map['lyrics'];
    chords = map['chords'];
    key = map['key'];
    chordsby = map['chordsby'];
    timestamp = map['timestamp'];
    bpm = map['bpm'];
    // key = map['key'];
    notes = map['notes'];
    timesignature = map['timesignature'];
    rhythm = map['rhythm'];
    complexity = map['complexity'];
    tags = map['tags'];
    rating = map['rating'];
    original = map['original'];
    // rating = map['rating'];
    usagecount = map['usagecount'];
    category = map['category'];
    additional = map['additional'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'lyrics': lyrics,
      'chords': chords,
      'key': key,
      'chordsby': chordsby,
      'timestamp': timestamp,
      'bpm': bpm,
      'notes': notes,
      'timesignature': timesignature,
      'rhythm': rhythm,
      'complexity': complexity,
      'tags': tags,
      'rating': rating,
      'original': original,
      'usagecount': usagecount,
      'category': category,
      'additional': additional,
    };
  }
}
