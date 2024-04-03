void main(List<String> args) {
  final List<List<String>> board = [
    ["A", "B", "C", "E"],
    ["S", "F", "C", "S"],
    ["A", "D", "E", "E"]
  ];

  final String word = "SEE";

  print(exist(board, word)); //true
}

bool exist(List<List<String>> board, String word) {
  final List<List<bool>> visited = List.generate(board.length,
      (index) => List.generate(board[index].length, (index) => false));
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (recursiveSearch(board, word, i, j, 0, visited)) {
        return true;
      }
    }
  }
  return false;
}

bool recursiveSearch(List<List<String>> board, String word, int i, int j,
    int index, List<List<bool>> visited) {
  //check if the word was found
  if (index == word.length) {
    return true;
  }
  //check if the current cell is valid
  if (i < 0 || i >= board.length || j < 0 || j >= board[i].length) {
    return false;
  }
  //Check if the current cell was already visited
  if (visited[i][j]) {
    return false;
  }
  //Check if the current cell has the correct letter
  if (board[i][j] != word[index]) {
    return false;
  }

  visited[i][j] = true;
  if (recursiveSearch(board, word, i + 1, j, index + 1, visited) ||
      recursiveSearch(board, word, i - 1, j, index + 1, visited) ||
      recursiveSearch(board, word, i, j + 1, index + 1, visited) ||
      recursiveSearch(board, word, i, j - 1, index + 1, visited)) {
    return true;
  }
  visited[i][j] = false;
  return false;
}
