library task_pk;

/// A Task.
class Task {
  String? id;
  String name;
  bool status;
  String location;
  DateTime? datetime;

  Task({
    required this.name,
    required this.status,
    required this.location,
    this.datetime,
    this.id,
  });

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        location = json['location'],
        datetime =
            json['datetime'] != null ? DateTime.parse(json['datetime']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'status': status,
      'location': location,
      'datetime': datetime != null ? datetime!.toIso8601String() : null,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  static List<Task> listFromJson(Map<String, dynamic>? json) {
    List<Task> tasks = [];

    json?.forEach((key, value) {
      Map<String, dynamic> item = {"id": key, ...value};
      tasks.add(Task.fromJson(item));
    });
    return tasks;
  }
}
