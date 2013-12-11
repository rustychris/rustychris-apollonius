// ------------------------------------------------------------------------------
// Copyright (c) 2011 GeometryFactory (FRANCE)
// Distributed under the Boost Software License, Version 1.0. (See accompany-
// ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
// ------------------------------------------------------------------------------ 


#ifndef SWIG_CGAL_APOLLONIUS_GRAPH_2_APOLLONIUS_GRAPH_HANDLES_H
#define SWIG_CGAL_APOLLONIUS_GRAPH_2_APOLLONIUS_GRAPH_HANDLES_H

#include <SWIG_CGAL/Common/Macros.h>
#include <SWIG_CGAL/Kernel/Point_2.h>

namespace SWIG_Apollonius_Graph_2{


// Sites
template <class Apollonius_Graph,class Point>
class CGAL_Site_2{
  typename Apollonius_Graph::Site_2 data; // or should it have ::Data_structure::
public:
  typedef CGAL_Site_2<Apollonius_Graph,Point> Self;

  CGAL_Site_2():data(){}

  // trouble getting it to accept the first argument here -
  CGAL_Site_2(const Point& p,double w):data(p.get_data(),w){}

  #ifndef SWIG
  typedef typename Apollonius_Graph::Site_2 cpp_base;
  CGAL_Site_2(typename Apollonius_Graph::Site_2 v):data(v){}
  const cpp_base& get_data() const {return data;}
        cpp_base& get_data()       {return data;}
  #endif

  Point point() const { return data.point(); }
  double weight() const { return data.weight(); }

  //Operations - convenience
  double x() const {return data.point().x();}
  double y() const {return data.point().y();}

  //I/O
    std::string toString(){
      std::stringstream sstr;
      sstr << data;
      return sstr.str();
    }
//  //Deep copy
//  Self deepcopy() const {return Self(data);}
//  void deepcopy(const Self& other){data=other.get_data();}
};



  // template arguments come from the line in CGAL_Apollonius_Graph_2.i
  // Apollonius_Graph <= CGAL_AG2 <= CGAL::Apollonius_graph_2<CGAL_AG2_Traits>
  // Point <= Point_2
template <class Apollonius_Graph,class Point>

class CGAL_Vertex_handle{
  typename Apollonius_Graph::Vertex_handle data;
  // no difference
  // typename Apollonius_Graph::Data_structure::Vertex_handle data;
public:
  typedef CGAL_Vertex_handle<Apollonius_Graph,Point> Self;
  #ifndef SWIG
  typedef typename Apollonius_Graph::Vertex_handle cpp_base;
  const cpp_base& get_data() const {return data;}
        cpp_base& get_data()       {return data;}
  #endif
//Creation
  CGAL_Vertex_handle():data(NULL){}
  #ifndef SWIG
  CGAL_Vertex_handle(typename Apollonius_Graph::Vertex_handle v):data(v){}
  #endif
//Access Functions -
  // this fails because it can't find site() as a method of the handle.
  // but it looks so similar to triangulation!
  // SWIG_CGAL_FORWARD_CALL_AND_REF_0(typename Apollonius_Graph::Site_2,site)
  // looking at the old apollonius code, it uses the handle like a smart ptr
  // but this appears unable to 
  CGAL_Site_2<Apollonius_Graph,Point> site(void) { return CGAL_Site_2<Apollonius_Graph,Point>(data->site()); }
//Setting
  //  SWIG_CGAL_FORWARD_CALL_1(void,set_point,Point)
//Equality functions  
  DEFINE_EQUALITY_OPERATORS(Self);
//hash function
  DEFINE_HASH_FUNCTION_FOR_HANDLE

//Deep copy
  Self deepcopy() const {return Self(data);}
  void deepcopy(const Self& other){data=other.get_data();} 
};

template <class Apollonius_Graph,class Point>
class CGAL_Face_handle{
  typename Apollonius_Graph::Face_handle data;
public:
  typedef CGAL_Face_handle<Apollonius_Graph,Point> Self;
  typedef CGAL_Vertex_handle<Apollonius_Graph,Point> Vertex_handle;

  CGAL_Face_handle():data(NULL){}
  #ifndef SWIG
  typedef typename Apollonius_Graph::Face_handle cpp_base;
  CGAL_Face_handle(typename Apollonius_Graph::Face_handle v):data(v){}
  const cpp_base& get_data() const {return data;}
        cpp_base& get_data()       {return data;}
  #endif

//  //Access Functions    
//    SWIG_CGAL_FORWARD_CALL_0(int,dimension)
//    SWIG_CGAL_FORWARD_CALL_AND_REF_1(Vertex_handle,vertex,int)
//    SWIG_CGAL_FORWARD_CALL_1(bool,has_vertex,Vertex_handle)
//    SWIG_CGAL_FORWARD_CALL_1(int,index,Vertex_handle)
//    SWIG_CGAL_FORWARD_CALL_AND_REF_1(CGAL_Face_handle,neighbor,int)
//    SWIG_CGAL_FORWARD_CALL_1(bool,has_neighbor,CGAL_Face_handle)
//    SWIG_CGAL_FORWARD_CALL_1(int,index,CGAL_Face_handle)
//  //Setting
//    SWIG_CGAL_FORWARD_CALL_2(void,set_vertex,int,Vertex_handle)
//    SWIG_CGAL_FORWARD_CALL_0(void,set_vertices)
//    SWIG_CGAL_FORWARD_CALL_3(void,set_vertices,Vertex_handle,Vertex_handle,Vertex_handle)
//    SWIG_CGAL_FORWARD_CALL_2(void,set_neighbor,int,CGAL_Face_handle)
//    SWIG_CGAL_FORWARD_CALL_0(void,set_neighbors)
//    SWIG_CGAL_FORWARD_CALL_3(void,set_neighbors,CGAL_Face_handle,CGAL_Face_handle,CGAL_Face_handle)
//  //Orientation
//    SWIG_CGAL_FORWARD_CALL_0(void,reorient)
//    SWIG_CGAL_FORWARD_CALL_0(void,ccw_permute)
//    SWIG_CGAL_FORWARD_CALL_0(void,cw_permute)
//  //Checking
//    SWIG_CGAL_FORWARD_CALL_0(bool,is_valid)
//    SWIG_CGAL_FORWARD_CALL_1(bool,is_valid,bool)

//Equality Functions  
  DEFINE_EQUALITY_OPERATORS(Self);
//hash function
  DEFINE_HASH_FUNCTION_FOR_HANDLE
 
//Deep copy
  Self deepcopy() const {return Self(data);}
  void deepcopy(const Self& other){data=other.get_data();}
};


} //namespace SWIG_Apollonius_Graph_2




#endif //SWIG_CGAL_APOLLONIUS_GRAPH_2_APOLLONIUS_GRAPH_HANDLES_H
