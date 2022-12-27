import 'dart:io';
import 'dart:async';

main() async {
  var systemTempDir = Directory.systemTemp;

  // List directory contents (inc. sub-directories, but not symlinks):
  Stream<FileSystemEntity> entityList =
      systemTempDir.list(recursive: true, followLinks: false);
  await for (FileSystemEntity entity in entityList) print(entity.path);

  // Create, rename, and write to a file:
  var file = await new File('${systemTempDir.path}/foo.txt').create();
  print('The path is ${file.path}');
  await file.rename('${systemTempDir.path}/bar.txt');
  print('The path is ${file.path}');
  file.writeAsString('Hello, world!');

  // Read file as string or list of strings:
  var contents = file.readAsString();
  print(contents);
  List<String> lines = file.readAsLines();
  lines.forEach((String line) => print(line));

  // Create directories and a symbolic link (symlink):
  var dir = await new Directory('dir/subdir').create(recursive: true);
  print(await dir.exists());
  var first_path = '${dir.path}${Platform.pathSeparator}first_path';
  var second_path = '${dir.path}${Platform.pathSeparator}second_path';
  Link symLink = await new Link(second_path).create(first_path);
  print(symLink);

  // Delete everything:
  await file.delete();
  print(await file.exists());
  await symLink.delete();
  print(await symLink.exists());
  await dir.delete();
  print(await dir.exists());
}
