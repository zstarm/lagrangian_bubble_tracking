 !-*- Fortran -*-
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Test Lagrangian Bubble Linked List
! 
! Written: Z. Starman (Jan. 2025)
! Description: Quick program to test inserting bubble elements into the linked list structure
!              designed to store Lagrangian bubble data type
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program linked_list_test
    use lg_bubble_linked_list
    IMPLICIT NONE

    integer ::  num_nodes
    integer :: i
    character(len=32) :: arg_buff
    character(len=1) :: print_arg !user will specify if position or radius is to be printed
    character(len=1) :: add_front_or_end

    !type(lg_bubble), TARGET :: new_bubble
    
    type(linked_list) :: myListHead
    type(lg_bubble), POINTER :: ptr_to_bubble


    ! Get the total number of command-line arguments
    call get_command_argument(1, arg_buff)
    read(arg_buff,*) num_nodes
    
    call get_command_argument(2, arg_buff)
    read(arg_buff,*) print_arg

    call get_command_argument(3, arg_buff)
    read(arg_buff,*) add_front_or_end
    
    do i=1,num_nodes
        allocate(ptr_to_bubble)
        ptr_to_bubble%xpos = 0.0
        ptr_to_bubble%ypos = 0.0
        ptr_to_bubble%zpos = 0.0
        ptr_to_bubble%radius = i*1.0
        if(add_front_or_end == 'f') then
            call insert_node_front(myListHead, ptr_to_bubble)
        else if(add_front_or_end == 'e') then
            call insert_node_end(myListHead, ptr_to_bubble)
        else 
            print *, "USE 'f' or 'e' to specify to add new nodes to front or end of linked list"
        end if
    end do
    
    
    call print_list(myListHead, print_arg)
    print *, "END OF PROGRAM"
end program linked_list_test
