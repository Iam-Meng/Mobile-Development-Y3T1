enum AssignmentStage { DRAFT, PUBLISHED, CLOSED }

class Assignment {
  final String id;
  final String courseId;
  final String title;
  AssignmentStage _stage = AssignmentStage.DRAFT;

  AssignmentStage get stage => _stage;

  Assignment({
    required this.id,
    required this.courseId,
    required this.title,
  });

  void transitionTo(AssignmentStage nextStage) {
    final isValidTransition = (_stage == AssignmentStage.DRAFT &&
            nextStage == AssignmentStage.PUBLISHED) ||
        (_stage == AssignmentStage.PUBLISHED &&
            nextStage == AssignmentStage.CLOSED);
    if (!isValidTransition) {
      throw StateError(
          'Invalid assignment stage transition: $_stage -> $nextStage');
    }
    _stage = nextStage;
  }
}
