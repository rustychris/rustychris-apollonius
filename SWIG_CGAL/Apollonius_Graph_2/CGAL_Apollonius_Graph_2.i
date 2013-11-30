// ------------------------------------------------------------------------------
// Copyright (c) 2012 GeometryFactory (FRANCE)
// Distributed under the Boost Software License, Version 1.0. (See accompany-
// ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
// ------------------------------------------------------------------------------ 


%module CGAL_Apollonius_Graph_2

%include "SWIG_CGAL/common.i"
Decl_void_type()

SWIG_CGAL_add_java_loadLibrary(CGAL_Apollonius_Graph_2)

%import  "SWIG_CGAL/Common/Macros.h"
%import  "SWIG_CGAL/Kernel/CGAL_Kernel.i"
%include "SWIG_CGAL/Common/Iterator.h"


//include files
%{
  #include <SWIG_CGAL/Apollonius_Graph_2/Object.h>
  #include <SWIG_CGAL/Apollonius_Graph_2/all_includes.h> 
  #include <SWIG_CGAL/Common/Iterator.h>
%}

//definitions
%include "SWIG_CGAL/Apollonius_Graph_2/Apollonius_Graph_2.h"
%include "SWIG_CGAL/Apollonius_Graph_2/apollonius_graph_handles.h" 

//local Object class: we cannot use the class from Kernel module as CGAL::Object uses RTTI
#ifdef SWIG_CGAL_Apollonius_Graph_2_MODULE
%include "SWIG_CGAL/Common/Object.i"
#endif

// these below were in declare_*.i

 // CLASSNAME_PREFIX => Apollonius_Graph_2
 // and things like Apollonius_Graph_2_Face_handle should exist
 // CPPTYPE => CGAL_AG2
 // POINT_TYPE => Point_2

 // using SWIG_CGAL_declare_identifier_of_template_class:
 // seems like the first argument is what it will show up as in the resulting module
 // the second argument is probably something defined in the SWIG_Apollonius_Graph_2 namespace,
 //   in apollonius_graph_handles.h.  I think that it is the concrete C++ class 
 // 

//Handles
SWIG_CGAL_declare_identifier_of_template_class(Apollonius_Graph_2_Face_handle,SWIG_Apollonius_Graph_2::CGAL_Face_handle<CGAL_AG2,Point_2>)

 // %typemap(javaimports) SWIG_Apollonius_Graph_2::CGAL_Vertex_handle %{import CGAL.Kernel.Point_2;%}

SWIG_CGAL_declare_identifier_of_template_class(Apollonius_Graph_2_Vertex_handle,SWIG_Apollonius_Graph_2::CGAL_Vertex_handle<CGAL_AG2,Point_2>)

SWIG_CGAL_declare_identifier_of_template_class(Site_2,SWIG_Apollonius_Graph_2::CGAL_Site_2<CGAL_AG2,Point_2>)

// and the object itself:
// for trianglation, there is
//   SWIG_CGAL_declare_triangulation_2(Triangulation_2,CGAL_T2,Point_2,CGAL::Tag_false)
//   => CLASSNAME=Triangulation_2
//      CPPTYPE=CGAL_T2,
//      POINT_TYPE=Point_2
//      WTAG=false
//    => EXPOSED_NAME = Triangulation_2
//       CLASSNAME_PREFIX=Triangulation_2
//       CPPTYPE=CGAL_T2,
//       POINT_TYPE=Point_2
//       WTAG=false



// %typemap(javaimports)          Triangulation_2_wrapper%{import CGAL.Kernel.POINT_TYPE; import CGAL.Kernel.Ref_int; import CGAL.Kernel.Segment_2; import CGAL.Kernel.Triangle_2; import CGAL.Kernel.Oriented_side; import CGAL.Triangulation_2.Locate_type; import CGAL.Triangulation_2.Ref_Locate_type_2; import java.util.Iterator; import java.util.Collection;%}

// // in the case of the wrapper class, it's defined in Apollonius_Graph_2.h
// this is enough to get a class Apollonius_Graph_2 - and members defined there show up on the object
SWIG_CGAL_declare_identifier_of_template_class(Apollonius_Graph_2, //EXPOSEDNAME
                                               Apollonius_Graph_2_wrapper<CGAL_AG2,
                                               Point_2,
                                               SWIG_Apollonius_Graph_2::CGAL_Vertex_handle<CGAL_AG2,Point_2>,
                                               SWIG_Apollonius_Graph_2::CGAL_Face_handle<CGAL_AG2,Point_2> ,
                                               SWIG_Apollonius_Graph_2::CGAL_Site_2<CGAL_AG2,Point_2> > ) // space between closing > is required!


// //Iterators and circulators
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Vertex_handle,import CGAL.Kernel.POINT_TYPE;)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_All_vertices_iterator,SWIG_CGAL_Iterator<CPPTYPE::All_vertices_iterator,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Vertex_handle,import CGAL.Kernel.POINT_TYPE;)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Finite_vertices_iterator,SWIG_CGAL_Iterator<CPPTYPE::Finite_vertices_iterator,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Face_handle,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_All_faces_iterator,SWIG_CGAL_Iterator<CPPTYPE::All_faces_iterator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Face_handle,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Finite_faces_iterator,SWIG_CGAL_Iterator<CPPTYPE::Finite_faces_iterator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Edge,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_All_edges_iterator,SWIG_CGAL_Iterator<CPPTYPE::All_edges_iterator,std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,CLASSNAME_PREFIX##_Edge,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Finite_edges_iterator,SWIG_CGAL_Iterator<CPPTYPE::Finite_edges_iterator,std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,POINT_TYPE,import CGAL.Kernel.POINT_TYPE;)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Point_iterator,SWIG_CGAL_Iterator<CPPTYPE::Point_iterator,POINT_TYPE>)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Face_handle,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Line_face_circulator,SWIG_CGAL_Circulator<CPPTYPE::Line_face_circulator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Face_handle,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Face_circulator,SWIG_CGAL_Circulator<CPPTYPE::Face_circulator,SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE> >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Edge,)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Edge_circulator,SWIG_CGAL_Circulator<CPPTYPE::Edge_circulator,std::pair<SWIG_Triangulation_2::CGAL_Face_handle<CPPTYPE,POINT_TYPE>,int > >)
// 
// SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Circulator,CLASSNAME_PREFIX##_Vertex_handle,import CGAL.Kernel.POINT_TYPE;)
// SWIG_CGAL_declare_identifier_of_template_class(CLASSNAME_PREFIX##_Vertex_circulator,SWIG_CGAL_Circulator<CPPTYPE::Vertex_circulator,SWIG_Triangulation_2::CGAL_Vertex_handle<CPPTYPE,POINT_TYPE> >)
// 
