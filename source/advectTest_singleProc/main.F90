 !-*- Fortran -*-
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! SINGLE PROCESSOR 'ADVECTION TEST' 
! 
! Written: Z. Starman (Jan. 2025)
! Description: Program to test subroutines designed for Lagrangian tracking of vapor bubbles moving 
!              with a prescribed flow field. Bubbles are stored by a doubly linked list structure
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program linked_list_test
    IMPLICIT NONE

    integer :: num_args, i
    character(len=32) :: arg_buff
    character(len=1) :: test_case !user will specify if position or radius is to be printed

    !call command_argument_count(num_args)
    num_args = command_argument_count()
    if(num_args.ne.1) then
        print *, "EXITING PROGRAM EARLY: Please specify one command line argument"
        print *, "USAGE: 1) advection test case: ('u')niform or ('c')ircular"
        call exit(-1)
    end if

    call get_command_argument(1, arg_buff)
    if(LEN(TRIM(arg_buff)).ne.1) then
        print *, "EXITING PROGRAM EARLY: argument of '", TRIM(arg_buff), "' is not allowed"
        print *, "use single charcter for specifying advection test case"
        !print *, "USAGE: 1) advection test case: ('u')niform or ('c')ircular"
        call exit(-2)
    end if

    read(arg_buff,*) test_case

    SELECT CASE (test_case)
        case ('u')
            !uniform flow (left to right)
            print *, "UNIFORM ADVECTION TEST"
            call uniform
        case ('c')
            !circular flow 
            print *, "CIRCULAR ADVECTION TEST"
            call circular

        case DEFAULT
            print *, "Unrecognized case selection please use: (u)niform or (c)ircular options"
    END SELECT 
    
    
    
    print *, "END OF PROGRAM"
end program linked_list_test

subroutine uniform
    use lg_bubble_dbly_linked_list
   
    IMPLICIT NONE
    
    type(linked_list) :: myListHead
    type(lg_bubble), POINTER :: ptr_newBubble
    
    !do i=1,num_nodes
    !    allocate(ptr_to_bubble)
    !    ptr_to_bubble%xpos = 0.0
    !    ptr_to_bubble%ypos = 0.0
    !    ptr_to_bubble%zpos = 0.0
    !    ptr_to_bubble%radius = i*1.0
    !    if(add_front_or_end == 'f') then
    !        call insert_node_front(myListHead, ptr_to_bubble)
    !    else if(add_front_or_end == 'e') then
    !        call insert_node_end(myListHead, ptr_to_bubble)
    !    else 
    !        print *, "USE 'f' or 'e' to specify to add new nodes to front or end of linked list"
    !    end if
    !end do
    
    !call print_list(myListHead, print_arg)

end subroutine uniform

subroutine circular
    use lg_bubble_dbly_linked_list
   
    IMPLICIT NONE
    
    type(linked_list) :: myListHead
    type(lg_bubble), POINTER :: ptr_newBubble

end subroutine circular
