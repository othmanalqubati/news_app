class Post{
  String id;
  String title;
  String content;
  String date_written;
  String featured_image;
  String votes_up,votes_down;
  String user_id;
  String category_id;


  Post(
      {required this.id,
      required this.title,
      required this.content,
      required this.date_written,
      required this.featured_image,
      required this.votes_up,
      required this.votes_down,
      required this.user_id,
      required this.category_id});


}
