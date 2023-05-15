template<typename T>
class Foo {
   T t;
public:
  Foo(const T& _t) : 
   t(_t) { }
  void mar(const T& t2)
   {  t=t+t2;   }
   T sil() const 
   {  return t;   }
};