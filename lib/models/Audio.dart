class Audio {
  final String audio;

  Audio({this.audio});

  Audio.fromMap(Map<String, dynamic> data) : audio = data['audio'];

  Map<String, dynamic> toMap() {
    return {
      'audio': audio,
    };
  }
}
