 !-*- Fortran -*-
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Test Lagrangian Bubble Linked List
! 
! Written: Z. Starman (Jan. 2025)
! Description: Quick program to test inserting bubble elements into the linked list structure
!              designed to store Lagrangian bubble data type
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program linked_list_test
    use lg_bubble_dbly_linked_list
    IMPLICIT NONE

    integer ::  i, num_args, num_nodes, remove_at
    character(len=32) :: arg_buff
    character(len=1) :: print_arg !user will specify if position or radius is to be printed
    character(len=1) :: add_front_or_end

    !type(lg_bubble), TARGET :: new_bubble
    
    type(linked_list) :: myList
    type(lg_bubble), POINTER :: ptr_to_bubble

    num_args = command_argument_count()

    if(num_args.ne.4) then
        print *, "EXITING PROGRAM EARLY"
        print *, "please specify 4 arguements: # of nodes, print preference ('r' = radius, 'p' = position, or 'a' for all)", &
            ", whether to add nodes to the ('f')ront or ('e')nd, and the index at which to remove a node"
        
        call exit(-1)
    end if

    ! Get the total number of command-line arguments
    call get_command_argument(1, arg_buff)
    read(arg_buff,*) num_nodes
    
    call get_command_argument(2, arg_buff)
    read(arg_buff,*) print_arg

    call get_command_argument(3, arg_buff)
    read(arg_buff,*) add_front_or_end
    
    call get_command_argument(4, arg_buff)
    read(arg_buff,*) remove_at
    
    do i=1,num_nodes
        allocate(ptr_to_bubble)
        ptr_to_bubble%xpos = 0.0
        ptr_to_bubble%ypos = 0.0
        ptr_to_bubble%zpos = 0.0
        ptr_to_bubble%radius = i*1.0
        if(add_front_or_end == 'f') then
            call insert_node_front(myList, ptr_to_bubble)
        else if(add_front_or_end == 'e') then
            call insert_node_end(myList, ptr_to_bubble)
        else 
            print *, "USE 'f' or 'e' to specify to add new nodes to front or end of linked list"
        end if
    end do

    !remove a node
    call remove_node_at(myList, remove_at)
    
    
    call print_list(myList, print_arg)
    print *, "END OF PROGRAM"
end program linked_list_test
