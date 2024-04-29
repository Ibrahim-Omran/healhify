abstract class ScanXrayChestState {}

class ScanXrayInitial extends ScanXrayChestState {}

class TakeImageFromUserState extends ScanXrayChestState {}

class TakeImageCropperFromUserState extends ScanXrayChestState {}
