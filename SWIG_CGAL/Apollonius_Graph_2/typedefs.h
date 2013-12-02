// ------------------------------------------------------------------------------
// Copyright (c) 2011 GeometryFactory (FRANCE)
// Distributed under the Boost Software License, Version 1.0. (See accompany-
// ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
// ------------------------------------------------------------------------------ 


#ifndef SWIG_CGAL_APOLLONIUS_GRAPH_2_TYPEDEFS_H
#define SWIG_CGAL_APOLLONIUS_GRAPH_2_TYPEDEFS_H

#include <SWIG_CGAL/Apollonius_Graph_2/config.h>
#include <SWIG_CGAL/Kernel/typedefs.h>
#include <CGAL/Apollonius_graph_2.h>
#include <CGAL/Apollonius_graph_traits_2.h>
#include <CGAL/Apollonius_graph_filtered_traits_2.h>

typedef CGAL::Apollonius_graph_traits_2<EPIC_Kernel>   CGAL_AG2_Traits;

typedef CGAL::Apollonius_graph_2<CGAL_AG2_Traits>          CGAL_AG2;

typedef CGAL_AG2::Site_2 AG2_Site; // this has been CGAL_AG2_Traits, but I think it is exposed on the AG2 itself, too.
typedef CGAL_AG2_Traits::Object_2  AG2_Object_2;

typedef CGAL_AG2::Data_structure AG2ds;
typedef AG2ds::Face_handle 				CGAL_AG2_face_handle;
typedef AG2ds::Vertex_handle 				CGAL_AG2_vertex_handle;
typedef AG2ds::Edge   				        CGAL_AG2_edge;

typedef AG2ds::Vertex 				CGAL_AG2_vertex;
typedef CGAL_AG2::Finite_vertices_iterator 	CGAL_AG2_finite_vertices_iterator;
typedef CGAL_AG2::All_vertices_iterator        CGAL_AG2_all_vertices_iterator;

// Faces:
typedef CGAL_AG2::All_faces_iterator     CGAL_AG2_all_faces_iterator;
typedef CGAL_AG2::Finite_faces_iterator  CGAL_AG2_finite_faces_iterator;
typedef CGAL_AG2::Face                   CGAL_AG2_face;
        
typedef CGAL_AG2::Sites_iterator 			AG2_site_iterator;


#endif //SWIG_CGAL_APOLLONIUS_GRAPH_2_TYPEDEFS_H
