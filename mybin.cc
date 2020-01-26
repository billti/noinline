#include "myclass.h"

int main() {
  MyTime foo;
  return foo.InDays() + MyTime::FromMinutes(10).InDays();
}
