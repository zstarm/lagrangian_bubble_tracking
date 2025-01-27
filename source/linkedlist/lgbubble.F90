 !-*- Fortran -*-
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Lagrangian Bubble Module
! 
! Written: Z. Starman (Jan. 2025)
! Description: Module pertaining to a custom data type which encapsulates data needed to perform 
!              Lagrangian unified bubble dynamics method. 
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module Lagrangian_bubble
    IMPLICIT NONE
    type :: lg_bubble
        real(kind=8) :: xpos, ypos, zpos
        real(kind=8) :: radius
    end type lg_bubble
end module Lagrangian_bubble

