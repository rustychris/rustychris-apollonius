%module CGAL_Triangulation_2

%include "SWIG_CGAL/common.i"
Decl_void_type()

%pragma(java) jniclasscode=%{
  static {
    try {
        System.loadLibrary("CGAL_Triangulation_2");
        System.loadLibrary("CGAL_Java");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library CGAL_Triangulation_2 failed to load. \n" + e);
      throw e;
    }
  }
%}

//Special treatment for enum in java
#ifdef SWIGJAVA
%include "enums.swg"
%javaconst(1);
#endif


%import  "SWIG_CGAL/Common/Macros.h"
%import  "SWIG_CGAL/Kernel/Point_2.h"
%import  "SWIG_CGAL/Kernel/Weighted_point_2.h"
%import  "SWIG_CGAL/Kernel/Segment_2.h"
%import  "SWIG_CGAL/Kernel/Triangle_2.h"
%import  "SWIG_CGAL/Kernel/enum.h"
%include "SWIG_CGAL/Common/Input_iterator.h"
%include "SWIG_CGAL/Common/Reference_wrapper.h"


%include "SWIG_CGAL/Triangulation_2/config.i"

//include files
%{
  #include <SWIG_CGAL/Triangulation_2/Triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/Delaunay_triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/Regular_triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/Constrained_triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/Constrained_Delaunay_triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/Constrained_triangulation_plus_2.h>
  #include <SWIG_CGAL/Triangulation_2/triangulation_handles.h>
  #include <SWIG_CGAL/Triangulation_2/triangulation_iterators.h>
  #include <SWIG_CGAL/Common/Reference_wrapper.h>
%}


//definitions
%include "SWIG_CGAL/Triangulation_2/Triangulation_2.h"
%include "SWIG_CGAL/Triangulation_2/Delaunay_triangulation_2.h"
%include "SWIG_CGAL/Triangulation_2/Regular_triangulation_2.h"
%include "SWIG_CGAL/Triangulation_2/Constrained_triangulation_2.h"
%include "SWIG_CGAL/Triangulation_2/Constrained_Delaunay_triangulation_2.h"
%include "SWIG_CGAL/Triangulation_2/Constrained_triangulation_plus_2.h"
%include "SWIG_CGAL/Triangulation_2/triangulation_handles.h"
%include "SWIG_CGAL/Triangulation_2/triangulation_iterators.h"

%pragma(java) jniclassimports=%{import CGAL.Kernel.Point_2; import CGAL.Kernel.Weighted_point_2; import CGAL.Kernel.Segment_2;  import CGAL.Kernel.Triangle_2;  import java.util.Iterator; import java.util.Collection; import CGAL.Java.JavaData;%}

//References
%template(Ref_int) Reference_wrapper<int>;
%template(Ref_Locate_type) Reference_wrapper<SWIG_Triangulation_2::Locate_type>;

//Constraint
%typemap(javaimports) std::pair<Point_2,Point_2> %{ import CGAL.Kernel.Point_2;%}
%include "std_pair.i"
%template(Constraint) std::pair<Point_2,Point_2>;

//typemap for point input iterator
Typemap_for_Input_iterator(Weighting_helper<CGAL::Tag_false>::Point_range,Point_2,Point_2,Point_2::cpp_base,SWIGTYPE_p_Point_2,"(LCGAL/Kernel/Point_2;)J",insert_range)
//typemap for weighted point input iterator
Typemap_for_Input_iterator(Weighting_helper<CGAL::Tag_true>::Point_range,Weighted_point_2,Weighted_point_2,Weighted_point_2::cpp_base,SWIGTYPE_p_Weighted_point_2,"(LCGAL/Kernel/Weighted_point_2;)J",insert_range)

//typemap for Constaints input iterator
Typemap_for_Input_iterator(Constraint_range,Constraint,Constraint,iConstraint,SWIGTYPE_p_std__pairT_Point_2_Point_2_t,"(LCGAL/Triangulation_2/Constraint;)J",insert_constraint_range)
#ifdef SWIGPYTHON
Typemap_for_Input_iterator_additional_function(Constrained_triangulation_2_wrapper::Constrained_triangulation_2_wrapper)
Typemap_for_Input_iterator_additional_function(Constrained_Delaunay_triangulation_2_wrapper::Constrained_Delaunay_triangulation_2_wrapper)
Typemap_for_Input_iterator_additional_function(Constrained_triangulation_plus_2_wrapper::Constrained_triangulation_plus_2_wrapper)
#endif

#ifdef   SWIG_EXPOSE_TRIANGULATION_2
%import "SWIG_CGAL/Triangulation_2/declare_triangulation_2.i"
Declare_triangulation_2(Triangulation_2,CGAL_T2,Point_2,CGAL::Tag_false)
#endif //SWIG_EXPOSE_TRIANGULATION_2

#ifdef   SWIG_EXPOSE_DELAUNAY_TRIANGULATION_2
%import "SWIG_CGAL/Triangulation_2/declare_Delaunay_triangulation_2.i"
Declare_Delaunay_triangulation_2(Delaunay_triangulation_2,CGAL_DT2)
#endif //SWIG_EXPOSE_DELAUNAY_TRIANGULATION_2

#ifdef   SWIG_EXPOSE_REGULAR_TRIANGULATION_2
%import "SWIG_CGAL/Triangulation_2/declare_regular_triangulation_2.i"
Declare_regular_triangulation_2(Regular_triangulation_2,CGAL_RT2)
#endif //SWIG_EXPOSE_REGULAR_TRIANGULATION_2

#ifdef   SWIG_EXPOSE_CONSTRAINED_TRIANGULATION_2
%import "SWIG_CGAL/Triangulation_2/declare_constrained_triangulation_2.i"
Declare_constrained_triangulation_2(Constrained_triangulation_2,CGAL_CT2)
#endif //SWIG_EXPOSE_CONSTRAINED_TRIANGULATION_2

#ifdef   SWIG_EXPOSE_CONSTRAINED_DELAUNAY_TRIANGULATION_2
%import "SWIG_CGAL/Triangulation_2/declare_constrained_Delaunay_triangulation_2.i"
Declare_constrained_Delaunay_triangulation_2(Constrained_Delaunay_triangulation_2,CGAL_CDT2)
#endif //SWIG_EXPOSE_CONSTRAINED_DELAUNAY_TRIANGULATION_2

#ifdef   SWIG_EXPOSE_CONSTRAINED_DELAUNAY_TRIANGULATION_PLUS_2
%import "SWIG_CGAL/Triangulation_2/declare_constrained_Delaunay_triangulation_plus_2.i"
Declare_constrained_Delaunay_triangulation_plus_2(Constrained_Delaunay_triangulation_plus_2,CGAL_CDTplus2)
#endif //SWIG_EXPOSE_CONSTRAINED_DELAUNAY_TRIANGULATION_PLUS_2
