String getFoodSelection(int selectedClickIndex) {
  switch (selectedClickIndex) {
    case 0:
      return "Plants";
    case 1:
      return "Meat";
    default:
      return "None";
  }
}

String getTypeSelection(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return "Producers";
    case 1:
      return "Consults";
    case 2:
      return "Decomposers";
    default:
      return "None";
  }
}
