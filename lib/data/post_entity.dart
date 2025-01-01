class PostEntity {
  // * postId
  // * postImages
  // * tags
  final String? username;
  final String? userProfile;
  final String? userBio;
  final String? createAt;
  final String? description;
  final String? postImage;
  final List<String>? tags;
  final List<String>? postImages;
  final num? totalReacts;
  final num? totalComments;
  final num? totalReposts;

  PostEntity(
      {this.username,
      this.userProfile,
      this.userBio,
      this.createAt,
      this.description,
      this.postImage,
      this.tags,
      this.postImages,
      this.totalReacts,
      this.totalComments,
      this.totalReposts});

  static List<PostEntity> postListData = [
    PostEntity(
        userProfile: "profile_1.jpeg",
        username: "John Doe",
        userBio: "100,000 followers",
        createAt: "8d",
        description:
            "Some common mistakes that flutter developer make while learning flutter.",
        postImage: "post_image_1.jpg",
        postImages: [
          "post_image_1.jpg",
          "post_image_2.jpg",
          "post_image_3.jpg"
        ],
        tags: ["https://edcx//marvey-o23"],
        totalReacts: 5,
        totalComments: 10,
        totalReposts: 4),
    PostEntity(
        userProfile: "profile_2.jpeg",
        username: "Doug Stevenson",
        userBio: "Headline",
        createAt: "8d",
        description:
            "Look at this javascript code I don't believe it what kind of people are living in this world haha",
        postImage: "post_image_2.jpg",
        postImages: [
          "post_image_2.jpg",
          "post_image_4.jpg",
          "post_image_1.jpg"
        ],
        tags: [],
        totalReacts: 10,
        totalComments: 44,
        totalReposts: 11),
    PostEntity(
        userProfile: "profile_3.jpeg",
        username: "Carig C. Watson",
        userBio: "Software Developer at Google #GDE",
        createAt: "2w",
        description:
            "Hey Folks!\nGoogle Devs. just released this new feature in Search Engine check it out.",
        postImage: "post_image_3.jpg",
        postImages: [
          "post_image_5.jpg",
          "post_image_2.jpg",
          "post_image_3.jpg",
          "post_image_1.jpg",
          "post_image_4.jpg"
        ],
        tags: [
          "#gde",
          "#googledevexpert",
          "#iosdevelopment",
          "#android",
          "#androidsummit",
          "#googlestudentsclub",
          "#growwithgoogle"
        ],
        totalReacts: 111,
        totalComments: 12,
        totalReposts: 20),
    PostEntity(
        userProfile: "profile_4.jpeg",
        username: "Diana Joe",
        userBio: "UX/UI Researcher | Product Manager at IBM",
        createAt: "4d",
        description:
            "Just look at this!\nthis man lost control and he's trying to find peace but unfortunately he's unable to find.",
        postImage: "post_image_4.jpg",
        postImages: [
          "post_image_1.jpg",
          "post_image_5.jpg",
          "post_image_2.jpg"
        ],
        tags: [
          "#gde",
          "#googledevexpert",
          "#iosdevelopment",
          "#android",
          "#androidsummit",
          "#googlestudentsclub",
          "#growwithgoogle"
        ],
        totalReacts: 4,
        totalComments: 8,
        totalReposts: 17),
    PostEntity(
        userProfile: "profile_5.jpeg",
        username: "Alexandera Tulip",
        userBio: "Inventor | Developer | Mobile Founder",
        createAt: "1d",
        description:
            "What's up people\nLook at this Alexander got something new to show you.",
        postImage: "post_image_5.jpg",
        postImages: [
          "post_image_3.jpg",
          "post_image_1.jpg",
          "post_image_4.jpg",
          "post_image_2.jpg"
        ],
        tags: [
          "#gde",
          "#googledevexpert",
          "#iosdevelopment",
          "#android",
          "#androidsummit",
          "#googlestudentsclub",
          "#growwithgoogle"
        ],
        totalReacts: 4,
        totalComments: 8,
        totalReposts: 17),
  ];
}
