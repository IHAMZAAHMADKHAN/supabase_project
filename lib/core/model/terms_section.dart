class TermsSection {
  final String title;
  final String? content; // The introductory text
  final List<String>? points; // The bullet points
  final String? footer; // Text appearing after bullet points

  TermsSection({
    required this.title,
    this.content,
    this.points,
    this.footer,
  });
}
