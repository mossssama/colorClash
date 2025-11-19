import 'dart:math';

List<int> generateValidCards() {
  List<int> previousNumbers = [];
  for (int i = 0; i < 7; i++) {
    int generatedNumber = Random().nextInt(9);
    while (previousNumbers.contains(generatedNumber)) {
      generatedNumber = Random().nextInt(9);
    }
    previousNumbers.add(generatedNumber);
  }
  return previousNumbers;
}


List<int> generateInValidCards(List<int> validCards) {
  List<int> initialCards = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  for (int i = 0; i < validCards.length; i++) {
    if (initialCards.contains(validCards[i])) {
      initialCards.remove(validCards[i]);
    }
  }
  return initialCards;
}