class Links {
  final String self;
  final String short;

  Links(this.self, this.short);

  Links.fromJson(Map<String, dynamic> json)
      : self = json['self'],
        short = json['short'];
}
