import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrls;
  final List<String> interests;
  final String bio;
  final String jobTitle;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.interests,
    required this.imageUrls,
    required this.bio,
    required this.jobTitle,
  });

  @override
  List<Object?> get props => [id, name, age, imageUrls, bio, jobTitle];

  static List<User> users = [
    const User(
      id: 1,
      name: 'Anna',
      age: 25,
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
      id: 2,
      name: 'Elena',
      age: 25,
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
      id: 3,
      name: 'Kate',
      age: 25,
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
      id: 4,
      name: 'Gracia',
      age: 25,
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
      id: 5,
      name: 'Gracia',
      age: 25,
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
      id: 6,
      name: 'Gracia',
      age: 25,
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
      id: 7,
      name: 'Gracia',
      age: 25,
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
