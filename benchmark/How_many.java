public class How_many {
  public static void main(String[] args) {
    long start = System.currentTimeMillis();
    int b = 0;
    int c = 0;
    for (int i = 0; i < 2_000_000_000; i++) {
      c = i;
      b = c - i;
      b = c + i;
      if (i < b) {
        b = i;
      }
      b = c;
    }
    System.out.println(System.currentTimeMillis() - start);
  }
}
