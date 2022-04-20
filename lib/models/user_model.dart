import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final int age;
  final String gender;
  final List<String> imageUrls;
  final List<String> interests;
  final String bio;
  final String jobTitle;
  final String location;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.interests,
    required this.imageUrls,
    required this.bio,
    required this.jobTitle,
    required this.gender,
    required this.location,
  });

  @override
  List<Object?> get props =>
      [id, name, age, imageUrls, bio, jobTitle, gender, location];

  static User fromSnapshot(DocumentSnapshot snap) {
    User user = User(
      id: snap.id,
      name: snap['name'],
      age: snap['age'],
      imageUrls: snap['imageUrls'],
      interests: snap['interests'],
      bio: snap['bio'],
      jobTitle: snap['jobTitle'],
      gender: snap['gender'],
      location: snap['location'],
    );
    return user;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'imageUrls': imageUrls,
      'interests': interests,
      'bio': bio,
      'jobTitle': jobTitle,
      'gender': gender,
      'location': location,
    };
  }

  User copyWith({
    String? id,
    String? name,
    int? age,
    String? gender,
    List<String>? imageUrls,
    List<String>? interests,
    String? bio,
    String? jobTitle,
    String? location,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      imageUrls: imageUrls ?? this.imageUrls,
      interests: interests ?? this.interests,
      bio: bio ?? this.bio,
      jobTitle: jobTitle ?? this.jobTitle,
      location: location ?? this.location,
    );
  }

  static List<User> users = [
    const User(
      id: '1',
      name: 'Anna',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600?random=1',
        'https://picsum.photos/400/600?random=2',
        'https://picsum.photos/400/600?random=3',
        'https://picsum.photos/400/600?random=4',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Sr. Design Manager',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    const User(
      id: '2',
      name: 'Elena',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600?random=5',
        'https://picsum.photos/400/600?random=6',
        'https://picsum.photos/400/600?random=7',
        'https://picsum.photos/400/600?random=8',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Job title',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    const User(
      id: '3',
      name: 'Kate',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600',
        'https://picsum.photos/400/600',
        'https://picsum.photos/400/600',
        'https://picsum.photos/400/600',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Job title',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    const User(
      id: '4',
      name: 'Gracia',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600?random=72',
        'https://picsum.photos/400/600?random=72',
        'https://picsum.photos/400/600?random=72',
        'https://picsum.photos/400/600?random=72',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Job title',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    const User(
      id: '5',
      name: 'Gracia',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600?random=71',
        'https://picsum.photos/400/600?random=71',
        'https://picsum.photos/400/600?random=71',
        'https://picsum.photos/400/600?random=71',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Job title',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    const User(
      id: '6',
      name: 'Gracia',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600?random=79',
        'https://picsum.photos/400/600?random=79',
        'https://picsum.photos/400/600?random=79',
        'https://picsum.photos/400/600?random=79',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Job title',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    const User(
      id: '7',
      name: 'Gracia',
      age: 25,
      gender: 'female',
      location: 'Vladivostok',
      imageUrls: [
        'https://picsum.photos/400/600',
        'https://picsum.photos/400/600',
        'https://picsum.photos/400/600',
        'https://picsum.photos/400/600',
      ],
      interests: ['Music', 'Design', 'Development'],
      jobTitle: 'Job title',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
  ];
}
