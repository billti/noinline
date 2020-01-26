#if defined(BUILDING_DLL)
#define DLLEXP __declspec(dllexport)
#else
#define DLLEXP __declspec(dllimport)
#endif

class DLLEXP MyTime final {
 public:
  constexpr MyTime() : seconds_(0) {}
  static MyTime FromMinutes(int minutes) {
    return MyTime(minutes * 60);
  }

  int InDays() const;
 private:
  explicit MyTime(int seconds) : seconds_(seconds) {}
  int seconds_;
};
