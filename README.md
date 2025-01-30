# lagrangian_bubble_tracking

## Repo Purpose
This repos is a collection of Fortran codes/modules being used to develop Lagrangian bubble/particle tracking (tracing) methods in an ambient fluid. 
The goal is develop an robust, efficient, and scalable (multiprocessing w/ MPI) method that can be added/implemented into CFDShip-Iowa. 
Therefore, this method is also aimed at being coupled with an Eulerian-based solver for the ambient fluid.

## Codes

### Linked List

#### Description
This directory contains a simple (singly) linked list that stores a Lagrangian bubble (lg_bubble) data type (elem) at each list node. 
This code was used to get familar with a linked list implementation in Fortran

#### Progress Notes
- Jan. 27, 2025: Simple linked list module added. Easily able to add to front or end of the list

### Doubly Linked List

#### Description
This was a modification to the original singly-linked list code. The list_node data type was updated to include another pointer back to previous node in the list.
Insert/Removal subroutines were modified to handle updating this additional pointer. 

#### Progress Notes
- Jan. 28, 2025: Created doubly linked list module with fork from original (singly) linked list module

- Jan. 29, 2025: Added node removal subroutines

### Advection Test (Single Processor)

#### Description
This a simple test is designed to test the practically and identify potential issues with linked list implementation for storing Lagrangian bubble parameters.

#### Progress Notes
- Jan. 29, 2025: Started developing simply uniform flow test case, and I made a subroutine to update bubble position given time step and velocity components
  - Need a way to make sure bubbles/particles are not colliding (i.e. spawn onto of each other based on position and size/radius)
  - Need to implement a interpolation scheme to get velocity components based on surrounding Eulerian grid points
  - Need an algorithm for efficiently finding the grid indices surrounding the bubble location in order to handle the 2 issues above 
