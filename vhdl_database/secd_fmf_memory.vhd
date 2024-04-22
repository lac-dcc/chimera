--------------------------------------------------------------------------------
--  File Name: memory.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001-2005 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V0.1     R. Munden   01 NOV 01   Initial beta release
--    V0.2     R. Munden   01 NOV 24   refined Table_generic_sram
--    V0.3     R. Munden   02 MAR 23   added Table_2_cntrl_sram
--    V0.4     A. Savic    05 JUN 15   extended for memory management routines
--                                     extended for routine comments
--    V0.5     R. Munden   06 JUN 04   corrected memory management routines
--                                     per Sergey Sulyutin
--
--------------------------------------------------------------------------------
LIBRARY IEEE;          USE IEEE.std_logic_1164.ALL;
                       USE IEEE.VITAL_primitives.ALL;
                       USE IEEE.VITAL_timing.ALL;
                       USE IEEE.vital_memory.ALL;

--------------------------------------------------------------------------------
PACKAGE memory IS

    ----------------------------------------------------------------------------
    -- Asynchronous SRAM with low chip enable and write enable
    ----------------------------------------------------------------------------
    CONSTANT Table_2_cntrl_sram : VitalMemoryTableType := (

    -- ----------------------------------------------------------
    -- CEN, WEN, Addr, DI, act, DO
    -- ----------------------------------------------------------
    -- Address initiated read
      ( '0', '1', 'G', '-', 's', 'm' ),
      ( '0', '1', 'U', '-', 's', 'l' ),

    -- CEN initiated read
      ( 'N', '1', 'g', '-', 's', 'm' ),
      ( 'N', '1', 'u', '-', 's', 'l' ),

    -- Write Enable initiated Write
      ( '0', 'P', 'g', '-', 'w', 'm' ),
      ( '0', 'N', '-', '-', 's', 'Z' ),

    -- CEN initiated Write
      ( 'P', '0', 'g', '-', 'w', 'Z' ),
      ( 'N', '0', '-', '-', 's', 'Z' ),

    -- Address change during write
      ( '0', '0', '*', '-', 'c', 'Z' ),
      ( '0', 'X', '*', '-', 'c', 'Z' ),

    -- if WEN is X
      ( '0', 'X', 'g', '*', 'e', 'e' ),
      ( '0', 'X', 'u', '*', 'c', 'l' ),

    -- CEN is unasserted
      ( 'X', '0', 'G', '-', 'e', 'Z' ),
      ( 'X', '0', 'u', '-', 'c', 'Z' ),
      ( 'X', '1', '-', '-', 's', 'l' ),
      ( '1', '-', '-', '-', 's', 'Z' )

    ); -- end of VitalMemoryTableType definition

    ----------------------------------------------------------------------------
    -- Asynchronous SRAM with high and low chip enables and output enable
    ----------------------------------------------------------------------------
    CONSTANT Table_generic_sram : VitalMemoryTableType := (

    -- ----------------------------------------------------------
    -- CE, CEN, OEN, WEN, Addr, DI, act, DO
    -- ----------------------------------------------------------
    -- Address initiated read
      ( '1', '0', '0', '1', 'G', '-', 's', 'm' ),
      ( '1', '0', '0', '1', 'U', '-', 's', 'l' ),

    -- Output Enable initiated read
      ( '1', '0', 'N', '1', 'g', '-', 's', 'm' ),
      ( '1', '0', 'N', '1', 'u', '-', 's', 'l' ),
      ( '1', '0', '0', '1', 'g', '-', 's', 'm' ),

    -- CE initiated read
      ( 'P', '0', '0', '1', 'g', '-', 's', 'm' ),
      ( 'P', '0', '0', '1', 'u', '-', 's', 'l' ),

    -- CEN initiated read
      ( '1', 'N', '0', '1', 'g', '-', 's', 'm' ),
      ( '1', 'N', '0', '1', 'u', '-', 's', 'l' ),

    -- Write Enable Implicit Read
      ( '1', '0', '0', 'P', '-', '-', 's', 'M' ),

    -- Write Enable initiated Write
      ( '1', '0', '1', 'N', 'g', '-', 'w', 'S' ),
      ( '1', '0', '1', 'N', 'u', '-', 'c', 'S' ),

    -- CE initiated Write
      ( 'P', '0', '1', '0', 'g', '-', 'w', 'S' ),
      ( 'P', '0', '1', '0', 'u', '-', 'c', 'S' ),

    -- CEN initiated Write
      ( '1', 'N', '1', '0', 'g', '-', 'w', 'Z' ),
      ( '1', 'N', '1', '0', 'u', '-', 'c', 'Z' ),

    -- Address change during write
      ( '1', '0', '1', '0', '*', '-', 'c', 'Z' ),
      ( '1', '0', '1', 'X', '*', '-', 'c', 'Z' ),

    -- data initiated Write
      ( '1', '0', '1', '0', 'g', '*', 'w', 'Z' ),
      ( '1', '0', '1', '0', 'u', '-', 'c', 'Z' ),
      ( '1', '0', '-', 'X', 'g', '*', 'e', 'e' ),
      ( '1', '0', '-', 'X', 'u', '*', 'c', 'S' ),

    -- if WEN is X
      ( '1', '0', '1', 'r', 'g', '*', 'e', 'e' ),
      ( '1', '0', '1', 'r', 'u', '*', 'c', 'l' ),
      ( '1', '0', '-', 'r', 'g', '*', 'e', 'S' ),
      ( '1', '0', '-', 'r', 'u', '*', 'c', 'S' ),
      ( '1', '0', '1', 'f', 'g', '*', 'e', 'e' ),
      ( '1', '0', '1', 'f', 'u', '*', 'c', 'l' ),
      ( '1', '0', '-', 'f', 'g', '*', 'e', 'S' ),
      ( '1', '0', '-', 'f', 'u', '*', 'c', 'S' ),

    -- OEN is unasserted
      ( '-', '-', '1', '-', '-', '-', 's', 'Z' ),
      ( '1', '0', 'P', '-', '-', '-', 's', 'Z' ),
      ( '1', '0', 'r', '-', '-', '-', 's', 'l' ),
      ( '1', '0', 'f', '-', '-', '-', 's', 'l' ),
      ( '1', '0', '1', '-', '-', '-', 's', 'Z' ),

    -- CE is unasserted
      ( '0', '-', '-', '-', '-', '-', 's', 'Z' ),
      ( 'N', '0', '-', '-', '-', '-', 's', 'Z' ),
      ( 'f', '0', '-', '-', '-', '-', 's', 'l' ),
      ( 'r', '0', '-', '-', '-', '-', 's', 'l' ),
      ( '0', '0', '-', '-', '-', '-', 's', 'Z' ),

    -- CEN is unasserted
      ( '-', '1', '-', '-', '-', '-', 's', 'Z' ),
      ( '1', 'P', '-', '-', '-', '-', 's', 'Z' ),
      ( '1', 'r', '-', '-', '-', '-', 's', 'l' ),
      ( '1', 'f', '-', '-', '-', '-', 's', 'l' ),
      ( '1', '1', '-', '-', '-', '-', 's', 'Z' )

    ); -- end of VitalMemoryTableType definition

    -- -------------------------------------------------------------------------
    -- Memory data initial value.
    -- Default value may be overridden by conigure_memory procedure
    -- -------------------------------------------------------------------------
    SHARED VARIABLE max_data     : NATURAL := 16#FF#;

    -- -------------------------------------------------------------------------
    -- Data types required to implement link list structure
    -- -------------------------------------------------------------------------
    TYPE mem_data_t;
    TYPE mem_data_pointer_t IS ACCESS mem_data_t;
    TYPE mem_data_t IS RECORD
        key_address  :  INTEGER;
        val_data     :  INTEGER;
        successor    :  mem_data_pointer_t;
    END RECORD;

    -- -------------------------------------------------------------------------
    -- Array of linked lists.
    -- Support memory region partitioning for faster access.
    -- -------------------------------------------------------------------------
    TYPE mem_data_pointer_array_t IS
        ARRAY(NATURAL RANGE <>) OF mem_data_pointer_t;

    -- -------------------------------------------------------------------------
    --
    -- Function Name:   configure_memory
    --
    -- Description:     Override mechanism default parameter values.
    --                  configure_memory routine is used to override default
    --                  memory initialization package parameter.
    --
    --                  The value of max_data parameter value refers to memory
    --                  initial data value, memory data width dependent.
    --
    -- Arguments:
    --
    --  IN             Type                   Description
    --   max_data_c     integer                Memory data initial value.
    --                                         The default is set to FFh.
    --
    --  INOUT
    --   none
    --
    --  OUT
    --   none
    --
    --  Returns
    --   none
    --
    -- -------------------------------------------------------------------------
    PROCEDURE configure_memory(
        max_data_c   :  IN INTEGER);

    -- -------------------------------------------------------------------------
    --
    -- Function Name:   corrupt_mem
    --
    -- Description:     corrupt_mem is used to perform memory data CORRUPT
    --                  operation above memory block or memory page region.
    --
    --                  Routine is built-in addressing performance parameters.
    --                  Routine performs N successive corrupt operations.
    --                  For N successive corrupt operations instead of :
    --                      N x find + N x corrupt -->
    --                  corrupt_mem provides the posiibility of :
    --                      1 x find + N x iterate + N x corrupt
    --                  Reducing the number of find element calls, operation
    --                  execution time is significantly affected.
    --
    --                  [address_low, adress_high] must belong to the same
    --                  memory parition, handled by a single list.
    --
    -- Arguments:
    --
    --  IN             Type                   Description
    --   address_low    integer                Starting address of the memory
    --                                         region to be corrupted.
    --   address_high   integer                The last address of the memory
    --                                         region to be corrupted.
    --
    --  INOUT
    --   linked_list    mem_data_pointer_t     Linked list holding memory region
    --                                         to be corrupted.
    --
    --  OUT
    --   none
    --
    --  Returns
    --   none
    --
    -- -------------------------------------------------------------------------
    PROCEDURE corrupt_mem(
        address_low      :  IN INTEGER;
        address_high     :  IN INTEGER;
        linked_list      :  INOUT mem_data_pointer_t);

    -- -------------------------------------------------------------------------
    --
    -- Function Name:   erase_mem
    --
    -- Description:     erase_mem is used to perform memory data ERASE
    --                  operation above memory block or memory page region.
    --
    --                  Routine is built-in addressing performance parameters.
    --                  Routine performs N successive erase operations.
    --                  For N successive erase operations instead of :
    --                      N x find + N x erase -->
    --                  erase_mem provides the posiibility of :
    --                      1 x find + N x iterate + N x erase
    --                  Reducing the number of find element calls, operation
    --                  execution time is significantly affected.
    --
    --                  [address_low, adress_high] must belong to the same
    --                  memory parition, handled by a single list.
    --
    -- Arguments:
    --
    --  IN             Type                   Description
    --   address_low    integer                Starting address of the memory
    --                                         region to be erased.
    --   address_high   integer                The last address of the memory
    --                                         region to be erased.
    --
    --  INOUT
    --   linked_list    mem_data_pointer_t     Linked list holding memory region
    --                                         to be erased.
    --
    --  OUT
    --   none
    --
    --  Returns
    --   none
    --
    -- -------------------------------------------------------------------------
    PROCEDURE erase_mem(
        address_low      :  IN INTEGER;
        address_high     :  IN INTEGER;
        linked_list      :  INOUT mem_data_pointer_t);

    -- ------------------------------------------------------------------------
    --
    -- Function Name:   read_mem
    --
    -- Description:     Memory READ operation performed above dynamically
    --                  allocated space.
    --
    --                  Iterates through a linked list data structure holding
    --                  memory data. Performs a search for an address match.
    --
    --                  If matched successfully, data kept by a linked list
    --                  element will be returned.
    --
    --                  In case no match occurred, no allocation has been
    --                  performed for the search address.
    --                  Memory data is never written, set to initial value.
    --                  Initial data value returned.
    --
    -- Arguments:
    --
    --  IN             Type                   Description
    --   address        integer                Data address to be read.
    --
    --  INOUT
    --   linked_list    mem_data_pointer_t     Linked list holding memory region
    --                                         to be read. Depends on DUT
    --                                         specific partition scheme.
    --   data           integer                Read operation result.
    --
    --  OUT
    --   none
    --
    --  Returns
    --   none
    --
    -- -------------------------------------------------------------------------
    PROCEDURE read_mem(
        linked_list  :  INOUT mem_data_pointer_t;
        data         :  INOUT INTEGER;
        address      :  IN INTEGER);

    -- -------------------------------------------------------------------------
    --
    -- Function Name:   write_mem
    --
    -- Description:     Memory WRITE operation performed above dynamically
    --                  allocated space.
    --
    --                  Iterates through a linked list data structure holding
    --                  memory data. Performs a search for an address match.
    --
    --                  If matched successfully, data kept by a linked list
    --                  element will be aligned with data argument value.
    --
    --                  In case no match occurred, no allocation has been
    --                  performed for the search address.
    --                  Memory space for a new element is allocated, linked
    --                  into a list and set to data argument value.
    --
    --                  If data argument value is recognized as initial,
    --                  memory space will be de-allocated for the addressed
    --                  location.
    --
    -- Arguments:
    --
    --  IN             Type                   Description
    --   address        integer                Address to be written.
    --   data           integer                Data to be written.
    --
    --  INOUT
    --   linked_list    mem_data_pointer_t     Linked list holding memory region
    --                                         to be written. Depends on DUT
    --                                         specific partition scheme.
    --
    --  OUT
    --   none
    --
    --  Returns
    --   none
    --
    -- -------------------------------------------------------------------------
    PROCEDURE write_mem(
        linked_list  :  INOUT mem_data_pointer_t;
        address      :  IN INTEGER;
        data         :  IN INTEGER);

END PACKAGE memory;

PACKAGE BODY memory IS
    -- -------------------------------------------------------------------------
    -- Override mechanism provided for default parameter values
    -- -------------------------------------------------------------------------
    PROCEDURE configure_memory(
        max_data_c   :  IN INTEGER) IS
    BEGIN
        max_data := max_data_c;
    END PROCEDURE configure_memory;

    -- -------------------------------------------------------------------------
    -- Create linked listed
    -- -------------------------------------------------------------------------
    PROCEDURE create_list(
        key_address  :  IN INTEGER;
        val_data     :  IN INTEGER;
        root         :  INOUT mem_data_pointer_t) IS
    BEGIN
        root := NEW mem_data_t;
        root.successor := NULL;
        root.key_address := key_address;
        root.val_data := val_data;
    END PROCEDURE create_list;

    -- -------------------------------------------------------------------------
    -- Iterate through linked listed comapring key values
    -- Stop when key value greater or equal
    -- -------------------------------------------------------------------------
    PROCEDURE position_list(
        key_address  :  IN INTEGER;
        root         :  INOUT mem_data_pointer_t;
        found        :  INOUT mem_data_pointer_t;
        prev         :  INOUT mem_data_pointer_t) IS
    BEGIN
        found := root;
        prev := NULL;
    --  Changed thanks to Sergey Selyutin
    --  WHILE ((found /= NULL) AND (found.key_address < key_address)) LOOP
        WHILE found /= NULL LOOP
            IF (found.key_address >= key_address) THEN
                EXIT;
            END IF;
            prev := found;
            found := found.successor;
        END LOOP;
    END PROCEDURE position_list;

    -- -------------------------------------------------------------------------
    -- Add new element to a linked list
    -- -------------------------------------------------------------------------
    PROCEDURE insert_list(
        key_address  :  IN INTEGER;
        val_data     :  IN INTEGER;
        root         :  INOUT mem_data_pointer_t) IS

        VARIABLE new_element  :  mem_data_pointer_t;
        VARIABLE found        :  mem_data_pointer_t;
        VARIABLE prev         :  mem_data_pointer_t;
    BEGIN
        position_list(key_address, root, found, prev);

        -- Insert at list tail
        IF (found = NULL) THEN
            prev.successor := NEW mem_data_t;
            prev.successor.key_address := key_address;
            prev.successor.val_data := val_data;
            prev.successor.successor := NULL;
        ELSE
            -- Element exists, update memory data value
            IF (found.key_address = key_address) THEN
                found.val_data := val_data;
            ELSE
                -- No element found, allocate and link
                new_element := NEW mem_data_t;
                new_element.key_address := key_address;
                new_element.val_data := val_data;
                new_element.successor := found;
                -- Possible root position
                IF (prev /= NULL) THEN
                    prev.successor := new_element;
                ELSE
                    root := new_element;
                END IF;
            END IF;
        END IF;
    END PROCEDURE insert_list;

    -- -------------------------------------------------------------------------
    -- Remove element from a linked list
    -- -------------------------------------------------------------------------
    PROCEDURE remove_list(
        key_address  :  IN INTEGER;
        root         :  INOUT mem_data_pointer_t) IS

        VARIABLE found      :  mem_data_pointer_t;
        VARIABLE prev       :  mem_data_pointer_t;
    BEGIN
        position_list(key_address, root, found, prev);
        IF (found /= NULL) THEN
            -- Key value match
            IF (found.key_address = key_address) THEN
                -- Handle root position removal
                IF (prev /= NULL) THEN
                    prev.successor := found.successor;
                ELSE
                    root := found.successor;
                END IF;
                DEALLOCATE(found);
            END IF;
        END IF;
    END PROCEDURE remove_list;

    -- -------------------------------------------------------------------------
    -- Remove range of elements from a linked list
    -- Higher performance than one-by-one removal
    -- -------------------------------------------------------------------------
    PROCEDURE remove_list_range(
        address_low  :  IN INTEGER;
        address_high :  IN INTEGER;
        root         :  INOUT mem_data_pointer_t) IS

        VARIABLE iter          :  mem_data_pointer_t;
        VARIABLE prev          :  mem_data_pointer_t;
        VARIABLE link_element  :  mem_data_pointer_t;
    BEGIN
        iter := root;
        prev := NULL;
        -- Find first linked list element belonging to
        -- a specified address range [address_low, address_high]
        -- Changed thanks to Sergey Sulyutin
        -- WHILE ((iter /= NULL) AND NOT (
        -- (iter.key_address >= address_low) AND
        -- (iter.key_address <= address_high))) LOOP
        WHILE iter /= NULL LOOP
            IF ((iter.key_address >= address_low) AND
            (iter.key_address <= address_high)) THEN
                EXIT;
            END IF;
            prev := iter;
            iter := iter.successor;
        END LOOP;
        -- Continue until address_high reached
        -- Deallocate linked list elements pointed by iterator
        IF (iter /= NULL) THEN
            -- Changed thanks to Sergey Sulyutin
            -- WHILE ((iter /= NULL) AND
            -- (iter.key_address >= address_low) AND
            -- (iter.key_address <= address_high)) LOOP
            WHILE iter /= NULL LOOP
                IF ((iter.key_address < address_low) OR
                (iter.key_address > address_high)) THEN
                    EXIT;
                END IF;
                link_element := iter.successor;
                DEALLOCATE(iter);
                iter := link_element;
            END LOOP;
            -- Handle possible root value change
            IF prev /= NULL THEN
                prev.successor := link_element;
            ELSE
                root := link_element;
            END IF;
        END IF;
    END PROCEDURE remove_list_range;

    -- -------------------------------------------------------------------------
    -- Create side linked list modelling corrupted memory area
    -- -------------------------------------------------------------------------
    PROCEDURE create_list_range(
        address_low     :  IN INTEGER;
        address_high    :  IN INTEGER;
        root            :  INOUT mem_data_pointer_t;
        last            :  INOUT mem_data_pointer_t) IS

        VARIABLE new_element  :  mem_data_pointer_t;
        VARIABLE prev         :  mem_data_pointer_t;
    BEGIN
        create_list(address_low, -1, root);
        prev := root;
        -- Linked list representing memory region :
        -- [address_low, address_high], memory data value corrupted
        -- Heightens corrupt and erase operation performance
        FOR I IN (address_low + 1) TO address_high LOOP
            new_element := NEW mem_data_t;
            new_element.key_address := I;
            new_element.val_data := -1;
            prev.successor := new_element;
            prev := new_element;
        END LOOP;
        prev.successor := NULL;
        last := prev;
    END PROCEDURE create_list_range;

    -- -------------------------------------------------------------------------
    -- Merge corrupted with memory area
    -- -------------------------------------------------------------------------
    PROCEDURE insert_list_range(
        root_dst      :  INOUT mem_data_pointer_t;
        root_src      :  INOUT mem_data_pointer_t;
        root_src_last :  INOUT mem_data_pointer_t) IS

        VARIABLE key    :  INTEGER;
        VARIABLE found  :  mem_data_pointer_t;
        VARIABLE prev   :  mem_data_pointer_t;
    BEGIN
        IF (root_dst /= NULL) THEN
            key := root_src.key_address;
            -- Insert side created corrupted memory region
            -- into corresponding linked list
            position_list(key, root_dst, found, prev);
            IF (found = NULL) THEN
                prev.successor := root_src;
            ELSE
                root_src_last.successor := found;
                IF (prev /= NULL) THEN
                    prev.successor := root_src;
                ELSE
                    root_dst := root_src;
                END IF;
            END IF;
        ELSE
            root_dst := root_src;
        END IF;
    END PROCEDURE insert_list_range;

    -- -------------------------------------------------------------------------
    -- Address range to be corrupted
    -- -------------------------------------------------------------------------
    PROCEDURE corrupt_mem(
        address_low      :  IN INTEGER;
        address_high     :  IN INTEGER;
        linked_list      :  INOUT mem_data_pointer_t) IS

        VARIABLE sub_linked_list       :  mem_data_pointer_t;
        VARIABLE sub_linked_list_last  :  mem_data_pointer_t;
    BEGIN
        sub_linked_list := NULL;
        sub_linked_list_last := NULL;
        IF (linked_list /= NULL) THEN
            remove_list_range(
                address_low,
                address_high,
                linked_list
                );
        END IF;
        create_list_range(
            address_low,
            address_high,
            sub_linked_list,
            sub_linked_list_last
            );
        insert_list_range(
            linked_list,
            sub_linked_list,
            sub_linked_list_last
            );
    END PROCEDURE corrupt_mem;

    -- -------------------------------------------------------------------------
    -- Address range to be erased
    -- -------------------------------------------------------------------------
    PROCEDURE erase_mem(
        address_low      :  IN INTEGER;
        address_high     :  IN INTEGER;
        linked_list      :  INOUT mem_data_pointer_t) IS

    BEGIN
        remove_list_range(
            address_low,
            address_high,
            linked_list
            );
    END PROCEDURE erase_mem;

    -- -------------------------------------------------------------------------
    -- Memory READ operation performed above dynamically allocated space
    -- -------------------------------------------------------------------------
    PROCEDURE read_mem(
        linked_list  :  INOUT mem_data_pointer_t;
        data         :  INOUT INTEGER;
        address      :  IN INTEGER) IS

        VARIABLE found     :  mem_data_pointer_t;
        VARIABLE prev      :  mem_data_pointer_t;
        VARIABLE mem_data  :  INTEGER;
    BEGIN
        IF (linked_list = NULL) THEN
            -- Not allocated, not written, initial value
            mem_data := max_data ;
        ELSE
            position_list(address, linked_list, found, prev);
            IF (found /= NULL) THEN
                IF found.key_address = address THEN
                    -- Allocated, val_data stored
                    mem_data := found.val_data;
                ELSE
                    -- Not allocated, not written, initial value
                    mem_data := max_data ;
                END IF;
            ELSE
                -- Not allocated, not written, initial value
                mem_data := max_data ;
            END IF;
        END IF;
        data := mem_data;
    END PROCEDURE read_mem;

    -- -------------------------------------------------------------------------
    -- Memory WRITE operation performed above dynamically allocated space
    -- -------------------------------------------------------------------------
    PROCEDURE write_mem(
        linked_list  :  INOUT mem_data_pointer_t;
        address      :  IN INTEGER;
        data         :  IN INTEGER) IS

    BEGIN
        IF (data /= max_data ) THEN
            -- Handle possible root value update
            IF (linked_list /= NULL) THEN
                insert_list(address, data, linked_list);
            ELSE
                create_list(address, data, linked_list);
            END IF;
        ELSE
            -- Deallocate if initial value written
            -- No linked list, NOP, initial value implicit
            IF (linked_list /= NULL) THEN
                remove_list(address, linked_list);
            END IF;
        END IF;
    END PROCEDURE write_mem;

END PACKAGE BODY memory;
