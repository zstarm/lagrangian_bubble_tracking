 !-*- Fortran -*-
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Doubly-Linked List of Lagrangian Bubbles Module
! 
! Written: Z. Starman (Jan. 2025)
! Description: Modification to the earlier linked list data structure such that previous ('prev') 
!              list node is also stored. This will be useful when make removing nodes during a 
!              single iteration over the list
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module lg_bubble_dbly_linked_list
    use Lagrangian_bubble
    IMPLICIT NONE

    type, public :: list_node
        type(lg_bubble), pointer :: elem    !data held by the node (polymorphic data field being used)
        type(list_node), POINTER :: next => null ()    !pointer to next node
        type(list_node), POINTER :: prev => null ()    !pointer to prev node
    end type list_node

    type, public :: linked_list
        type(list_node), pointer :: head => null()    ! Head of the list
    end type linked_list

    contains

        subroutine insert_node_front(this, node_value)
            type(linked_list) :: this    !our linked list (stores 'head' pointing to start of list)
            type(lg_bubble), POINTER :: node_value    !value to be held by the node
            type(list_node), POINTER :: new_node    !new node to be inserted at front

            !create a new node for the list
            allocate(new_node)

            new_node%elem => node_value    !node element points to newly allocated value
            new_node%next => this%head    !"next" points at the previous start of the list
            if(associated(this%head)) then 
                this%head%prev => new_node    !"change the previous first node to now point back at the new node/start
            end if
            
            this%head => new_node    !this's "head" is updated to now points to the new node (new start of the list)

            return
        end subroutine insert_node_front
        
        subroutine insert_node_end(this, node_value)
            type(linked_list) :: this    !head of the list to traverse
            type(list_node), POINTER :: current_node
            type(lg_bubble), POINTER :: node_value    !value to be held by the node
            type(list_node), POINTER :: new_node    !new node to be inserted at end of loop

            allocate(new_node)
            new_node%elem => node_value
            current_node => this%head
            if(associated(current_node)) then
                !traverse to end of list
                do while(associated(current_node))
                if(.not.(associated(current_node%next))) exit
                                
                current_node => current_node%next
                end do
           
                current_node%next => new_node
                new_node%prev => current_node
            else 
                !list doesn't have any elements yet!
                this%head => new_node
            end if
            
            return
        end subroutine insert_node_end

        subroutine print_list(this, param)

            type(linked_list) :: this    !node we want to start printing from
            character(len=1) :: param    !node we want to start printing from
            type(list_node), POINTER :: current_node

            if(param == 'r') then 
                current_node => this%head
                do while(associated(current_node))
                    print *, current_node%elem%radius
                    current_node => current_node%next
                end do
            else if(param == 'p') then 
                current_node => this%head
                do while(associated(current_node))
                    print *, "(", current_node%elem%xpos, ",", current_node%elem%ypos, ",", current_node%elem%zpos, ")"
                    current_node => current_node%next
                end do
            else if(param == 'a') then 
                current_node => this%head
                do while(associated(current_node))
                    print *, "R is:", current_node%elem%radius 
                    print *, "Pos is:", "(", current_node%elem%xpos, ",", current_node%elem%ypos, ",", current_node%elem%zpos, ")"
                    current_node => current_node%next
                end do
            else 
                print *, "UNRECOGNIZED BUBBLE PARAMETER"
            end if
            return
        end subroutine print_list
        
end module lg_bubble_dbly_linked_list
