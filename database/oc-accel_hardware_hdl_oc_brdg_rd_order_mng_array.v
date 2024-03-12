/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

module brdg_rd_order_mng_array 
                        (
                            input                    clk       ,
                            input                    rst_n     ,

                            //reserve interface
                            input                    rsv_valid ,
                            input           [0001:0] rsv_pos   ,
                            input         [`TAGW-1:0] rsv_tag   ,
                            input                    rsv_last  ,
                            input                    rsv_first,  //TODO: used only in wr channel add rsv_first for write channel
                            input          [`IDW-1:0] rsv_axi_id,

                            //response docode interface
                            input                    rsp_valid ,
                            input         [`TAGW-1:0] rsp_tag   ,
                            input           [0002:0] rsp_code  ,
                            input           [0001:0] rsp_pos   ,

                            //output signals for read data buffer
                            output wire              rd_valid  ,
                            output wire   [`TAGW-1:0] rd_tag    ,

                            //output signals for recycle tag buffer
                            output wire              rec_valid ,
                            output wire   [`TAGW-1:0] rec_tag   ,

                            //interface with axi_slave module
                            output reg               ret_valid ,
                            output reg     [`IDW-1:0] ret_axi_id,
                            output reg               ret_resp  ,  
                            output reg               ret_last  ,  // signal only for read
                            `ifndef ENABLE_ODMA
                            input                    ret_ready 
                            `else
                            input           [0031:0] ret_ready_hint,
                            input           [0031:0] ret_ready
                            `endif

                        );

    parameter IDN  = 2**`IDW;      // number of axi id supported
    parameter ARYD = 2**`TAGW;     // array depth


    //--------------------------------------------------------------------------------------------------------  
    //-------------------------------- beat information array ------------------------------------------------
    //-------------------------reserve information for all inflight beats ------------------------------------
    //--------------------------------------------------------------------------------------------------------  
    // basic elements
    reg             beat_info_ev[ARYD-1:0]      ; // entry valid
    reg [1:0]       beat_info_rv[ARYD-1:0]      ; // response valid
    reg             beat_info_rc[ARYD-1:0]      ; // response code: 0 for good response, 1 for error response
    reg [`TAGW-1:0]  beat_info_nxt_ptr[ARYD-1:0] ; // next tag pointer, pointer to the entry of the next beat
    reg             beat_info_nptr_v[ARYD-1:0]  ; // indicate whether the nxt_ptr poniter is valid or not
    reg [`IDW-1:0]   beat_info_axi_id[ARYD-1:0]  ; // axi id
    reg             beat_info_last[ARYD-1:0]    ; // indicate this is the last beat of a burst
    // related logic signals
    wire [ARYD-1:0] reserve_beat_info_entry     ;
    wire [ARYD-1:0] clear_beat_info_entry       ;
    wire [ARYD-1:0] reserve_nxt_ptr             ;
    wire [ARYD-1:0] current_entry_rsp_rdy       ;
    //wire [ARYD-1:0] beat_info_valid_vector      ;

    //--------------------------------------------------------------------------------------------------------  
    //---------------------------------- previous ptr array --------------------------------------------------
    //-------------------------reserve tag of the last input beat for each axi id ----------------------------
    //--------------------------------------------------------------------------------------------------------  
    // basic elements
    reg [`TAGW-1:0]  pre_ptr[IDN-1:0]            ; // previous tag poniter, record entry tag of the previous input beat
    reg             pre_ptr_valid[IDN-1:0]      ; // indicate whether the pre_ptr pointer is valid or not
    // related logic signals
    wire [IDN-1:0]  reserve_pre_ptr;
    wire [IDN-1:0]  clear_pre_ptr;
    reg             rsv_valid_latch;
    reg [`TAGW-1:0]  rsv_pre_ptr_latch           ; // latch to buffer the previous point every time when there is a beat input
    reg [`TAGW-1:0]  rsv_tag_latch               ; // latch to buffer the current tag of the input beat
    reg [`IDW-1:0]   rsv_axi_id_latch            ;
    reg             rsv_beat_nh_latch           ; // indicate the beat come in the previous cycle is not a head beat
    wire [IDN-1:0]  rsv_valid_latch_for_idx     ;

    //--------------------------------------------------------------------------------------------------------  
    //----------------------------------- head beat tag array ------------------------------------------------
    //---------------------------reserve tag of head beat for each axi id ------------------------------------
    //--------------------------------------------------------------------------------------------------------  
    // basic elements
    reg [`TAGW-1:0]  head_beat_tag[IDN-1:0]      ; // head beat array, record the head beat tag of each AXI ID
    reg             head_beat_tag_valid[IDN-1:0]; // head beat valid
    // related logic signals
    wire [IDN-1:0]  reserve_new_head_beat       ;
    wire [IDN-1:0]  update_head_beat            ;
    wire [IDN-1:0]  clear_head_beat             ;
    
    //--------------------------------------------------------------------------------------------------------  
    //----------------------------------- ready to response latch array --------------------------------------
    //---------------------------latch information of the ready to respone beats for each axi id -------------
    //-------------------------------------------------------------------------------------------------------- 
    // basic elements
    reg [IDN-1:0]   rdy_to_rsp_valid         ; 
    reg [IDN-1:0]   rdy_to_rsp_rc            ; // response code, 0 for good response, 1 for error response
    reg [IDN-1:0]   rdy_to_rsp_last          ; // indicate this is the last beat of a burst
    reg [`TAGW-1:0]  rdy_to_rsp_tag[IDN-1:0]  ; // tag of the ready to response beat
    // related logic signals
    wire [IDN-1:0]  rdy_to_get_rsp           ;
    wire [IDN-1:0]  store_rsp_in             ;
    wire [IDN-1:0]  load_rsp_out             ;
    wire [IDN-1:0]  rdy_for_next_stage       ; 
    wire [IDN*`TAGW-1:0] rsp_tag_vector       ;
    wire [IDN*`TAGW-1:0] tag_mask_vector      ;
    wire [IDN*`IDW-1:0]  rsp_axi_id_vector    ;
    wire [IDN*`IDW-1:0]  axi_id_mask_vector   ;
    wire [`TAGW*IDN-1:0] tag_permute_vector    ;
    wire [`IDW*IDN-1:0]  axi_id_permute_vector ;
    wire [IDN*`IDW-1:0]  rdy_to_rsp_axi_id    ;

    wire            nretry_rsp_valid; //response valid and it is a good or bad response, not retry
    wire            nretry_rsp_code;  //0 for good response, 1 for bad response
    wire [ARYD-1:0] rsp_hi_valid;
    wire [ARYD-1:0] rsp_lo_valid;
    wire [ARYD-1:0] rsp_in;
    wire [IDN-1:0]  priority_tmp_a;
    wire [IDN-1:0]  priority_tmp_b;
    wire            rsp_latch_rdy;
    reg [IDN-1:0]   load_rsp_out_latch;
    wire            tag_stuck;
    wire            rsp_latch_valid_o;
    wire [`TAGW-1:0] rsp_latch_tag_o;
    wire            rsp_latch_rc_o;
    wire            rsp_latch_last_o;
    wire [`IDW-1:0]  rsp_latch_axi_id_o;
    wire            select_a;
    reg  [`TAGW-1:0] ret_tag;


    integer p;
    genvar i;
    genvar j;

    //############################################################################################
    //#----beat info array, restore the information of a beat. each entry of this array has -----#
    //#----the following fields:                                                            -----#
    //#----                    -------------------------------------                        -----#
    //#----                    |ev|rv|rc|nptr_v|nxt_ptr|axi_id|last|                        -----#
    //#----                    -------------------------------------                        -----#
    //#----  beat_info_ev: 1 bit to indicate whether this entry is valid or not             -----#
    //#----  beat_info_rv: 2 bit response valid information                                 -----#
    //#----  beat_info_rc: 1 bit response code information. 0 for good and 1 for error      -----#
    //#----  beat_info_nptr_v: 1 bit to indicate whether the nxt_ptr in this entry is valid -----#
    //#----  beat_info_nxt_ptr: `TAGW bit for tag of the next beat                           -----#
    //#----  beat_info_axi_id: `IDW bit for axi id                                           -----#
    //#----  beat_info_last: 1 bit to indicate whether this is the last beat in a burst     -----#
    //############################################################################################
    
    //----------when a beat come in: set ev and reserve axi_id, last        -------------
    //----------other field in this array is reserved/updated in later stage-------------
    wire [ARYD-1:0] entry_valid_for_debug; //signal only for debug
    generate 
        for(i=0; i<ARYD; i=i+1)
        begin:beat_info_ev_array

            assign reserve_beat_info_entry[i] = rsv_valid && (rsv_tag == i);
            //assign beat_info_valid_vector[i] = beat_info_ev[i];

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    beat_info_ev[i] <= 0;
                else if(reserve_beat_info_entry[i])
                    beat_info_ev[i] <= 1;
                else if(clear_beat_info_entry[i])
                    beat_info_ev[i] <= 0;
            end

            assign clear_beat_info_entry[i] = rdy_to_get_rsp[beat_info_axi_id[i]] &&        //rdy_to_rsp_latch ready to get rsp beat 
                                              current_entry_rsp_rdy[i] &&                   //current entry is ready to rsp
                                              (head_beat_tag[beat_info_axi_id[i]] == i) &&  //current entry is head beat
                                              (head_beat_tag_valid[beat_info_axi_id[i]]);

            assign entry_valid_for_debug[i] = beat_info_ev[i]; //signal only for debug
           
        end
    endgenerate 

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            for(p=0; p<ARYD; p=p+1)
            begin
                beat_info_axi_id[p] <= 0;
            end
        else if(rsv_valid)
            beat_info_axi_id[rsv_tag] <= rsv_axi_id;
    end
                          
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            for(p=0; p<ARYD; p=p+1)
            begin
                beat_info_last[p] <= 0;
            end
        else if(rsv_valid)
            beat_info_last[rsv_tag] <= rsv_last;
    end

    //############################################################################################
    //#---- previous pointer array, restore the tag of the previous beat in the same AXI ID -----#
    //#---- Every time when a beat come, do the following:                                  -----#
    //#---- 1) store the tag of the current beat to pre_ptr_array                           -----#
    //#---- 2) read out the tag of the previous beat from pre_ptr array and                 -----#
    //#----    sotre it to the rsv_pre_ptr_latch                                            -----#
    //#---- 3) store the tag of the current beat to rsv_tag_latch                           -----#
    //#---- 4) use rsv_pre_ptr_latch as address, sotre rsv_tag_latch to certain entry in    -----#
    //#----    beat_info_nxt_ptr array                                                      -----#
    //############################################################################################


    //----1) sotre tag of current beat to pre_ptr_array and   ---------------
    //----   release the entry when response last beat to lcl ---------------
    generate 
        for(j=0; j<IDN; j=j+1)
        begin:pre_ptr_array

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    pre_ptr_valid[j] <= 0;
                else if(reserve_pre_ptr[j])
                    pre_ptr_valid[j] <= 1;
                else if(clear_pre_ptr[j])
                    pre_ptr_valid[j] <= 0;
            end
           
            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    pre_ptr[j] <= 0;
                else if(reserve_pre_ptr[j])
                    pre_ptr[j] <= rsv_tag;
            end

            assign reserve_pre_ptr[j] = rsv_valid && (rsv_axi_id == j);

            //if the pre_ptr ponit to a head beat entry that is to be cleared, this pre_ptr entry should also be cleared
            assign clear_pre_ptr[j] = clear_head_beat[j] && (!rsv_valid_latch_for_idx[j]);
            assign rsv_valid_latch_for_idx[j] = rsv_valid_latch && (rsv_axi_id_latch == j);

        end
    endgenerate 

    //----2) read out the tag of the previous beat from pre_ptr array and 
    //----   sotre it to the rsv_pre_ptr_latch
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rsv_pre_ptr_latch <= 0;
        else if(rsv_valid)
            rsv_pre_ptr_latch <= pre_ptr[rsv_axi_id];
    end

    //----3) store the tag of the current beat to rsv_tag_latch 
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rsv_tag_latch <= 0;
        else if(rsv_valid)
            rsv_tag_latch <= rsv_tag;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rsv_axi_id_latch <= 0;
        else if(rsv_valid)
            rsv_axi_id_latch <= rsv_axi_id;
    end

    //----4) use rsv_pre_ptr_latch as address, sotre rsv_tag_latch to certain 
    //----   entry in beat_info_nxt_ptr array
    generate 
        for(i=0; i<ARYD; i=i+1)
        begin:beat_info_nptr_array


            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    beat_info_nxt_ptr[i] <= 0;
                else if(reserve_nxt_ptr[i])
                    beat_info_nxt_ptr[i] <= rsv_tag_latch;
            end

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    beat_info_nptr_v[i] <= 0;
                else if(clear_beat_info_entry[i])
                    beat_info_nptr_v[i] <= 0;
                else if(reserve_nxt_ptr[i])
                    beat_info_nptr_v[i] <= 1;
            end

            assign reserve_nxt_ptr[i] = rsv_beat_nh_latch && (rsv_pre_ptr_latch == i);
        end
    endgenerate 

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rsv_valid_latch <= 0;
        else 
            rsv_valid_latch <= rsv_valid;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rsv_beat_nh_latch <= 0;
        else
            rsv_beat_nh_latch <= rsv_valid && pre_ptr_valid[rsv_axi_id] && (!clear_pre_ptr[rsv_axi_id]);
    end

    //############################################################################################
    //#--------- Head beat tag array: store head beat tag for each axi id              ----------#
    //#--------- Can be updated in 3 conditions:                                       ----------#
    //#---------   1) A head beat of an axi id is input and should be reserved:        ----------#
    //#---------      a) a beat is input and it has no pre_ptr, it should be head beat ----------#
    //#---------      b) a beat is input. Its pre_ptr is head beat and will be cleared ----------#
    //#---------         in this cycle. This input beat should be new head beat        ----------#
    //#---------      c) a beat is input and has been reserved to beat info array in   ----------#
    //#---------         previous cycle. It should be write as nxt_ptr of its pre_ptr  ----------#
    //#---------         in this cycle. But its pre_ptr is ready to response and will  ----------#
    //#---------         be cleared in this cycle. In this condition, this beat will   ----------#
    //#---------         not be reserved to nxt_ptr entry of its pre_ptr but will be   ----------#
    //#---------         reserved as head beat.                                        ----------#
    //#---------   2) A head beat is responsed to lcl and its nxt_ptr should be        ----------#
    //#---------      updated as head beat                                             ----------#
    //#---------   3) A head beat is responsed to lcl and it has no                    ----------#
    //#---------      nxt_ptr, this head beat tag array entry should be cleared        ----------#
    //############################################################################################

    generate
        for(j=0; j<IDN; j=j+1)
        begin:head_beat_tag_array

            assign reserve_new_head_beat[j] = rsv_valid_latch_for_idx[j] && (!rsv_beat_nh_latch || clear_head_beat[j]);
            assign update_head_beat[j] = store_rsp_in[j] && beat_info_nptr_v[head_beat_tag[j]];
            assign clear_head_beat[j] = store_rsp_in[j] && (!beat_info_nptr_v[head_beat_tag[j]]);

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    head_beat_tag_valid[j] <= 0;
                else if(reserve_new_head_beat[j])
                    head_beat_tag_valid[j] <= 1;
                else if(clear_head_beat[j])
                    head_beat_tag_valid[j] <= 0;
            end

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    head_beat_tag[j] <= 0;
                else if(reserve_new_head_beat[j])
                    head_beat_tag[j] <= rsv_tag_latch;
                else if(update_head_beat[j])
                    head_beat_tag[j] <= beat_info_nxt_ptr[head_beat_tag[j]];
            end

        end
    endgenerate

    //############################################################################################
    //#----beat info array, restore the information of a beat. 1 entry of this array has    -----#
    //#----the following fields:                                                            -----#
    //#----                    -------------------------------------                        -----#
    //#----                    |ev|rv|rc|nptr_v|nxt_ptr|axi_id|last|                        -----#
    //#----                    -------------------------------------                        -----#
    //#----  beat_info_ev: 1 bit to indicate whether this entry is valid or not             -----#
    //#----  beat_info_rv: 2 bit response valid information                                 -----#
    //#----  beat_info_rc: 1 bit response code information. 0 for good and 1 for error      -----#
    //#----  beat_info_nptr_v: 1 bit to indicate whether the nxt_ptr in this entry is valid -----#
    //#----  beat_info_nxt_ptr: `TAGW bit for tag of the next beat                           -----#
    //#----  beat_info_axi_id: `IDW bit for axi id                                           -----#
    //#----  beat_info_last: 1 bit to indicate whether this is the last beat in a burst     -----#
    //############################################################################################
    
    //----------when a response come in: set rv and rc field -------------
    assign nretry_rsp_valid = rsp_valid;
    assign nretry_rsp_code = rsp_code[2];

    generate
        for(i=0; i<ARYD; i=i+1)
        begin:beat_info_rsp_array
            assign rsp_in[i] = nretry_rsp_valid && (rsp_tag == i);
            assign rsp_hi_valid[i] = rsp_in[i] && rsp_pos[1];
            assign rsp_lo_valid[i] = rsp_in[i] && rsp_pos[0];

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    beat_info_rv[i][0] <= 0;
                else if(reserve_beat_info_entry[i])
                    beat_info_rv[i][0] <= ~rsv_pos[0];
                else if(rsp_lo_valid[i])
                    beat_info_rv[i][0] <= 1;
                else if(clear_beat_info_entry[i])
                    beat_info_rv[i][0] <= 0; 
            end

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    beat_info_rv[i][1] <= 0;
                else if(reserve_beat_info_entry[i])
                    beat_info_rv[i][1] <= ~rsv_pos[1];
                else if(rsp_hi_valid[i])
                    beat_info_rv[i][1] <= 1;
                else if(clear_beat_info_entry[i])
                    beat_info_rv[i][1] <= 0; 
            end

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    beat_info_rc[i] <= 0;
                else if(rsp_in[i])
                    beat_info_rc[i] <= beat_info_rc[i] | nretry_rsp_code;
                else if(clear_beat_info_entry[i])
                    beat_info_rc[i] <= 0;
            end
 
            assign current_entry_rsp_rdy[i] = beat_info_rv[i][0] && beat_info_rv[i][1];

        end
    endgenerate

    //############################################################################################
    //#---- ready to response latch array:                                                  -----#
    //#----           latch information of the ready to respone beats for each axi id       -----#
    //#---- 1) Everytime when the head beat tag array want to update or clear a entry,      -----#
    //#----    store the related beat to this latch                                         -----# 
    //#---- 2) For all the beat in this latch array, select one to response out,            -----#
    //#----    the priority is decided as below:                                            -----#
    //#----    a) For all the axi_id entry in this array, if one entry is responsed out in  -----#                 
    //#----       the previous cycle, this entry will be considered with the highest        -----#
    //#----       prority in this cycle                                                     -----#       
    //#----    b) If a) is not the case, then choose the entry with the minimum axi id as   -----#
    //#----       the one with highest priority                                             -----#
    //############################################################################################

    // a)
    `ifndef ENABLE_ODMA
    assign rdy_for_next_stage = rdy_to_rsp_valid;
    `else
    assign rdy_for_next_stage = rdy_to_rsp_valid & ret_ready_hint;
    `endif

    assign priority_tmp_a = load_rsp_out_latch;
    assign select_a = |(load_rsp_out_latch & rdy_for_next_stage);

    // b) The right most set bit is picked as the suitable entry to response
    // The algorithm:
    // 1100 = i
    // 0011 = ~i
    // 0100 = -i (~i + 1)
    // 0100 = -i&i
    assign priority_tmp_b = ( -rdy_for_next_stage) & rdy_for_next_stage;

    assign load_rsp_out = select_a ? priority_tmp_a : priority_tmp_b;

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            load_rsp_out_latch <= 0;
        else if(rsp_latch_rdy)
            load_rsp_out_latch <= load_rsp_out;
    end

    generate
        for(j=0; j<IDN; j=j+1)
        begin:rdy_to_rsp_latch_array
            
            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    rdy_to_rsp_valid[j] <= 0;
                else if(store_rsp_in[j])
                    rdy_to_rsp_valid[j] <= 1;
                else if(load_rsp_out[j] && rsp_latch_rdy)
                    rdy_to_rsp_valid[j] <= 0;
            end

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                begin
                    rdy_to_rsp_rc[j]   <= 0;
                    rdy_to_rsp_last[j] <= 0;
                    rdy_to_rsp_tag[j]  <= 0;
                end
                else if(store_rsp_in[j])
                begin
                    rdy_to_rsp_rc[j]   <= beat_info_rc[head_beat_tag[j]];
                    rdy_to_rsp_last[j] <= beat_info_last[head_beat_tag[j]];
                    rdy_to_rsp_tag[j]  <= head_beat_tag[j];
                end
            end

            assign store_rsp_in[j] = head_beat_tag_valid[j] && rdy_to_get_rsp[j] && current_entry_rsp_rdy[head_beat_tag[j]];
            assign rdy_to_get_rsp[j] = !rdy_to_rsp_valid[j] || (load_rsp_out[j] && rsp_latch_rdy);
        end
    endgenerate

    //############################################################################################
    //#----                        Output response signals                                  -----#
    //############################################################################################

    `ifdef ENABLE_ODMA
        assign rsp_latch_rdy = !ret_valid || ret_ready[ret_axi_id];
    `else
        assign rsp_latch_rdy = !ret_valid || ret_ready;
    `endif

    assign rsp_latch_valid_o = |load_rsp_out; 
    assign rsp_latch_rc_o = |(load_rsp_out & rdy_to_rsp_rc);
    assign rsp_latch_last_o = |(load_rsp_out & rdy_to_rsp_last);

    generate
        for(i=0; i<IDN; i=i+1)
        begin:rsp_signal_gen

            assign tag_mask_vector[(i+1)*`TAGW-1:i*`TAGW] = {`TAGW{load_rsp_out[i]}};
            assign axi_id_mask_vector[(i+1)*`IDW-1:i*`IDW] = {`IDW{load_rsp_out[i]}};
            assign rdy_to_rsp_axi_id[(i+1)*`IDW-1:i*`IDW] = i;

        end
    endgenerate

    generate
        for(i=0; i<IDN; i=i+1)
        begin:rsp_permute_gen

            for(j=0; j<`TAGW; j=j+1)
            begin:tag_value_vector_gen
                assign tag_permute_vector[j*IDN+i] = rdy_to_rsp_tag[i][j] & tag_mask_vector[i*`TAGW+j];
            end
           
            for(j=0; j<`IDW; j=j+1)
            begin:id_value_vector_gen
                assign axi_id_permute_vector[j*IDN+i] = rdy_to_rsp_axi_id[i*`IDW+j] & axi_id_mask_vector[i*`IDW+j];
            end

        end
    endgenerate

    generate
        for(j=0; j<`TAGW; j=j+1)
        begin:rsp_tag_gen
            assign rsp_latch_tag_o[j] = |tag_permute_vector[(j+1)*IDN-1:j*IDN];
        end
    endgenerate

    generate
        for(j=0; j<`IDW; j=j+1)
        begin:rsp_axi_id_gen
            assign rsp_latch_axi_id_o[j] = |axi_id_permute_vector[(j+1)*IDN-1:j*IDN];
        end
    endgenerate

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            ret_valid <= 0;
        else if(rsp_latch_valid_o)
            ret_valid <= 1;
        `ifdef ENABLE_ODMA
        else if(ret_ready[ret_axi_id])
            ret_valid <= 0;
        `else
        else if(ret_ready)
            ret_valid <= 0;
        `endif
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            ret_tag <= 0;
            ret_axi_id <= 0;
            ret_resp <= 0;
            ret_last <= 0;
        end
        else if(rsp_latch_valid_o && rsp_latch_rdy)
        begin
            ret_tag <= rsp_latch_tag_o;
            ret_axi_id <= rsp_latch_axi_id_o; 
            ret_resp <= rsp_latch_rc_o;
            ret_last <= rsp_latch_last_o;
        end
    end

    `ifdef ENABLE_ODMA
    assign tag_stuck = ret_valid && (!ret_ready[ret_axi_id]);
    assign rec_valid = ret_valid && ret_ready[ret_axi_id];
    `else
    assign tag_stuck = ret_valid && (!ret_ready);
    assign rec_valid = ret_valid && ret_ready;
    `endif

    assign rd_valid = rsp_latch_valid_o || tag_stuck;
    assign rd_tag = tag_stuck ? ret_tag : rsp_latch_tag_o;

    assign rec_tag = ret_tag;


    //==============================================================================================================
    //================================             psl coverage              =======================================
    //==============================================================================================================
    // psl default clock = (posedge clk);
    wire [IDN-1:0] pre_ptr_reserve_at_clean;
    wire [IDN-1:0] rsv_beat_at_clear_head;
    wire [IDN-1:0] rsv_beat_at_idle_head;
    wire [IDN-1:0] rsv_head_at_clear;
    wire [IDN-1:0] store_rsp_at_loadout;
    generate 
        for(j=0; j<IDN; j=j+1)
        begin:id_array_cover
            assign pre_ptr_reserve_at_clean[j] = reserve_pre_ptr[j] && clear_pre_ptr[j];
            assign rsv_beat_at_clear_head[j] = rsv_valid_latch_for_idx[j] && clear_head_beat[j];
            assign rsv_beat_at_idle_head[j] = rsv_valid_latch_for_idx[j] && (!rsv_beat_nh_latch);
            assign rsv_head_at_clear[j] = reserve_new_head_beat[j] && clear_head_beat[j];
            assign store_rsp_at_loadout[j] = store_rsp_in[j] && load_rsp_out[j] && rsp_latch_rdy;
            //---- make sure we have checked the condition when reserve_pre_ptr and clear_pre_ptr 
            //---- happen in the same time and they are handled by the right priority
            //---- if we can not cover this case for all 32 axi ids, at least cover it for id
            // psl PRE_PTR_RESERVE_AT_CLEAN : cover {(reserve_pre_ptr[j] && clear_pre_ptr[j])};

            //---- make sure we have checked the condition when reserve a new beat for idx and its
            //---- head beat is beening cleared at the same time, so that the new beat should be 
            //---- stored to the head beat array entry for this id
            //---- if we can not cover this case for all 32 axi ids, at least cover it for id
            // psl RSV_BEAT_AT_CLEAR_HEAD : cover {(rsv_valid_latch_for_idx[j] && clear_head_beat[j])};

            //---- make sure we have checked the condition when reserve a new beat for idx and this
            //---- axi id has no head beat now, so that the new beat should be 
            //---- stored to the head beat array entry for this id
            //---- if we can not cover this case for all 32 axi ids, at least cover it for id
            // psl RSV_BEAT_AT_IDLE_HEAD : cover {(rsv_valid_latch_for_idx[j] && (!rsv_beat_nh_latch))};
            
            //---- make sure we have checked the condition when reserve a new head beat for idx and
            //---- the previous head beat for this id is been cleared at the same time and they are handled
            //---- by the right priority
            // psl RSV_HEAD_AT_CLEAR : cover {(reserve_new_head_beat[j] && clear_head_beat[j])};
           
            //---- make sure we have checked the condition when store rsp in response latch array and
            //---- load rsp out of this array happen at the same time and this 2 actions are handled by
            //---- the right priority
            // psl STORE_RSP_AT_LOADOUT_ARRAY : cover {(store_rsp_in[j] && load_rsp_out[j] && rsp_latch_rdy)};

        end
    endgenerate 
    // psl PRE_PTR_RESERVE_AT_CLEAN_SIMPLE : cover {(|pre_ptr_reserve_at_clean[IDN-1:0])};
    // psl RSV_BEAT_AT_CLEAR_HEAD_SIMPLE : cover {(|rsv_beat_at_clear_head[IDN-1:0])};
    // psl RSV_BEAT_AT_IDLE_HEAD_SIMPLE : cover {(|rsv_beat_at_idle_head[IDN-1:0])};
    // psl RSV_HEAD_AT_CLEAR_SIMPLE : cover {(|rsv_head_at_clear[IDN-1:0])};
    // psl STORE_RSP_AT_LOADOUT_SIMPLE : cover {(|store_rsp_at_loadout[IDN-1:0])};

    wire [ARYD-1:0] clear_beat_at_rsv_nxtp;
    generate 
        for(i=0; i<ARYD; i=i+1)
        begin:tag_array_cover
            assign clear_beat_at_rsv_nxtp[i] = clear_beat_info_entry[i] && reserve_nxt_ptr[i];

            //---- make sure we have checked the condition when clear beat info entry and reserve its nxt_ptr 
            //---- happens at the same time and these 2 actions are handled in the right priority
            // psl CLEAR_BEAT_AT_RSV_NXTP : cover {(clear_beat_info_entry[i] && reserve_nxt_ptr[i])};
        end
    endgenerate
    // psl CLEAR_BEAT_AT_RSV_NXTP_SIMPLE : cover {(|clear_beat_at_rsv_nxtp[ARYD-1:0])};


    //---- make sure we have checked the condition when reserve a new beat
    //---- and its previous beat is been cleared
    // psl RSV_BEAT_AT_CLEAR_PRE : cover {(rsv_valid && pre_ptr_valid[rsv_axi_id] && clear_pre_ptr[rsv_axi_id])};
    
    //---- make sure we have checked the condition when store rsp to ret_xxx registers and load rsp out of these
    //---- regsters happen at the same time and store and load are handled in right priority
    // psl  STORE_RSP_AT_LOADOUT_REG : cover {(rsp_latch_valid_o && ret_ready)};

`ifdef ILA_DEBUG
    reg   [31:0]     rsv_counter                 ;
    reg   [31:0]     ret_counter                 ;
    reg   [31:0]     ret_idle_counter            ;

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rsv_counter <= 32'b0;
        else if (rsv_valid)
            rsv_counter <= rsv_counter + 1'b1;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            ret_counter <= 32'b0;
        `ifdef ENABLE_ODMA
        else if (ret_valid && ret_ready[ret_axi_id])
            ret_counter <= ret_counter + 1'b1;
        `else
        else if (ret_valid && ret_ready)
            ret_counter <= ret_counter + 1'b1;
        `endif
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(rst_n)
            ret_idle_counter <= 32'b0;
        `ifdef ENABLE_ODMA
        else if(ret_valid && ret_ready[ret_axi_id])
            ret_idle_counter <= 32'b0;
        `else
        else if(ret_valid && ret_ready)
            ret_idle_counter <= 32'b0;
        `endif
        else 
            ret_idle_counter <= ret_idle_counter + 1'b1;
    end

    reg   [31:0]     rsv_counter_sync1           ;
    reg   [31:0]     ret_counter_sync1           ;
    reg   [31:0]     ret_idle_counter_sync1      ;
    reg              rsv_valid_sync1             ;
    reg   [`TAGW-1:0] rsv_tag_sync1               ;
    reg              rsv_last_sync1              ;
    reg              rsv_first_sync1             ; 
    reg    [`IDW-1:0] rsv_axi_id_sync1            ;
    reg              rsp_valid_sync1             ;
    reg   [`TAGW-1:0] rsp_tag_sync1               ;
    reg              ret_valid_sync1       ;
    reg    [`IDW-1:0] ret_axi_id_sync1            ;
    reg              ret_last_sync1              ; 
    reg              ret_ready_sync1             ;
    reg   [ARYD-1:0] entry_valid_for_debug_sync1 ;

    reg   [31:0]     rsv_counter_sync2           ;
    reg   [31:0]     ret_counter_sync2           ;
    reg   [31:0]     ret_idle_counter_sync2      ;
    reg              rsv_valid_sync2             ;
    reg   [`TAGW-1:0] rsv_tag_sync2               ;
    reg              rsv_last_sync2              ;
    reg              rsv_first_sync2             ; 
    reg    [`IDW-1:0] rsv_axi_id_sync2            ;
    reg              rsp_valid_sync2             ;
    reg   [`TAGW-1:0] rsp_tag_sync2               ;
    reg              ret_valid_sync2       ;
    reg    [`IDW-1:0] ret_axi_id_sync2            ;
    reg              ret_last_sync2              ; 
    reg              ret_ready_sync2             ;
    reg   [ARYD-1:0] entry_valid_for_debug_sync2 ;

    reg   [31:0]     rsv_counter_sync3           ;
    reg   [31:0]     ret_counter_sync3           ;
    reg   [31:0]     ret_idle_counter_sync3      ;
    reg              rsv_valid_sync3             ;
    reg   [`TAGW-1:0] rsv_tag_sync3               ;
    reg              rsv_last_sync3              ;
    reg              rsv_first_sync3             ; 
    reg    [`IDW-1:0] rsv_axi_id_sync3            ;
    reg              rsp_valid_sync3             ;
    reg   [`TAGW-1:0] rsp_tag_sync3               ;
    reg              ret_valid_sync3       ;
    reg    [`IDW-1:0] ret_axi_id_sync3            ;
    reg              ret_last_sync3              ; 
    reg              ret_ready_sync3             ;
    reg   [ARYD-1:0] entry_valid_for_debug_sync3 ;

    reg   [31:0]     rsv_counter_sync4           ;
    reg   [31:0]     ret_counter_sync4           ;
    reg   [31:0]     ret_idle_counter_sync4      ;
    reg              rsv_valid_sync4             ;
    reg   [`TAGW-1:0] rsv_tag_sync4               ;
    reg              rsv_last_sync4              ;
    reg              rsv_first_sync4             ; 
    reg    [`IDW-1:0] rsv_axi_id_sync4            ;
    reg              rsp_valid_sync4             ;
    reg   [`TAGW-1:0] rsp_tag_sync4               ;
    reg              ret_valid_sync4       ;
    reg    [`IDW-1:0] ret_axi_id_sync4            ;
    reg              ret_last_sync4              ; 
    reg              ret_ready_sync4             ;
    reg   [ARYD-1:0] entry_valid_for_debug_sync4 ;

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            rsv_counter_sync1           <= 0 ;
            ret_counter_sync1           <= 0 ;
            ret_idle_counter_sync1      <= 0 ;
            rsv_valid_sync1             <= 0;
            rsv_tag_sync1               <= 0;
            rsv_last_sync1              <= 0;
            rsv_first_sync1             <= 0; 
            rsv_axi_id_sync1            <= 0;
            rsp_valid_sync1             <= 0;
            rsp_tag_sync1               <= 0;
            ret_valid_sync1       <= 0;
            ret_axi_id_sync1            <= 0;
            ret_last_sync1              <= 0; 
            ret_ready_sync1             <= 0;
            entry_valid_for_debug_sync1 <= 0;

            rsv_counter_sync2           <= 0 ;
            ret_counter_sync2           <= 0 ;
            ret_idle_counter_sync2      <= 0 ;
            rsv_valid_sync2             <= 0;
            rsv_tag_sync2               <= 0;
            rsv_last_sync2              <= 0;
            rsv_first_sync2             <= 0; 
            rsv_axi_id_sync2            <= 0;
            rsp_valid_sync2             <= 0;
            rsp_tag_sync2               <= 0;
            ret_valid_sync2       <= 0;
            ret_axi_id_sync2            <= 0;
            ret_last_sync2              <= 0; 
            ret_ready_sync2             <= 0;
            entry_valid_for_debug_sync2 <= 0;

            rsv_counter_sync3           <= 0 ;
            ret_counter_sync3           <= 0 ;
            ret_idle_counter_sync3      <= 0 ;
            rsv_valid_sync3             <= 0;
            rsv_tag_sync3               <= 0;
            rsv_last_sync3              <= 0;
            rsv_first_sync3             <= 0; 
            rsv_axi_id_sync3            <= 0;
            rsp_valid_sync3             <= 0;
            rsp_tag_sync3               <= 0;
            ret_valid_sync3       <= 0;
            ret_axi_id_sync3            <= 0;
            ret_last_sync3              <= 0; 
            ret_ready_sync3             <= 0;
            entry_valid_for_debug_sync3 <= 0;

            rsv_counter_sync4           <= 0 ;
            ret_counter_sync4           <= 0 ;
            ret_idle_counter_sync4      <= 0 ;
            rsv_valid_sync4             <= 0;
            rsv_tag_sync4               <= 0;
            rsv_last_sync4              <= 0;
            rsv_first_sync4             <= 0; 
            rsv_axi_id_sync4            <= 0;
            rsp_valid_sync4             <= 0;
            rsp_tag_sync4               <= 0;
            ret_valid_sync4       <= 0;
            ret_axi_id_sync4            <= 0;
            ret_last_sync4              <= 0; 
            ret_ready_sync4             <= 0;
            entry_valid_for_debug_sync4 <= 0;
        end
        else
        begin
            rsv_counter_sync1           <= rsv_counter;
            ret_counter_sync1           <= ret_counter;
            ret_idle_counter_sync1      <= ret_idle_counter;
            rsv_valid_sync1             <= rsv_valid;
            rsv_tag_sync1               <= rsv_tag;
            rsv_last_sync1              <= rsv_last;
            rsv_first_sync1             <= rsv_first; 
            rsv_axi_id_sync1            <= rsv_axi_id;
            rsp_valid_sync1             <= rsp_valid;
            rsp_tag_sync1               <= rsp_tag;
            ret_valid_sync1             <= ret_valid;
            ret_axi_id_sync1            <= ret_axi_id;
            ret_last_sync1              <= ret_last;
            `ifdef ENABLE_ODMA
            ret_ready_sync1             <= ret_ready[0];
            `else
            ret_ready_sync1             <= ret_ready;
            `endif
            entry_valid_for_debug_sync1 <= entry_valid_for_debug;

            rsv_counter_sync2           <= rsv_counter_sync1;
            ret_counter_sync2           <= ret_counter_sync1;
            ret_idle_counter_sync2      <= ret_idle_counter_sync1;
            rsv_valid_sync2             <= rsv_valid_sync1            ;
            rsv_tag_sync2               <= rsv_tag_sync1              ;
            rsv_last_sync2              <= rsv_last_sync1             ;
            rsv_first_sync2             <= rsv_first_sync1            ; 
            rsv_axi_id_sync2            <= rsv_axi_id_sync1           ;
            rsp_valid_sync2             <= rsp_valid_sync1            ;
            rsp_tag_sync2               <= rsp_tag_sync1              ;
            ret_valid_sync2             <= ret_valid_sync1      ;
            ret_axi_id_sync2            <= ret_axi_id_sync1           ;
            ret_last_sync2              <= ret_last_sync1             ; 
            ret_ready_sync2             <= ret_ready_sync1            ;
            entry_valid_for_debug_sync2 <= entry_valid_for_debug_sync1;

            rsv_counter_sync3           <= rsv_counter_sync2;
            ret_counter_sync3           <= ret_counter_sync2;
            ret_idle_counter_sync3      <= ret_idle_counter_sync2;
            rsv_valid_sync3             <= rsv_valid_sync2            ;
            rsv_tag_sync3               <= rsv_tag_sync2              ;
            rsv_last_sync3              <= rsv_last_sync2             ;
            rsv_first_sync3             <= rsv_first_sync2            ; 
            rsv_axi_id_sync3            <= rsv_axi_id_sync2           ;
            rsp_valid_sync3             <= rsp_valid_sync2            ;
            rsp_tag_sync3               <= rsp_tag_sync2              ;
            ret_valid_sync3             <= ret_valid_sync2      ;
            ret_axi_id_sync3            <= ret_axi_id_sync2           ;
            ret_last_sync3              <= ret_last_sync2             ; 
            ret_ready_sync3             <= ret_ready_sync2            ;
            entry_valid_for_debug_sync3 <= entry_valid_for_debug_sync2;

            rsv_counter_sync4           <= rsv_counter_sync3;
            ret_counter_sync4           <= ret_counter_sync3;
            ret_idle_counter_sync4      <= ret_idle_counter_sync3;
            rsv_valid_sync4             <= rsv_valid_sync3            ;
            rsv_tag_sync4               <= rsv_tag_sync3              ;
            rsv_last_sync4              <= rsv_last_sync3             ;
            rsv_first_sync4             <= rsv_first_sync3            ; 
            rsv_axi_id_sync4            <= rsv_axi_id_sync3           ;
            rsp_valid_sync4             <= rsp_valid_sync3            ;
            rsp_tag_sync4               <= rsp_tag_sync3              ;
            ret_valid_sync4             <= ret_valid_sync3      ;
            ret_axi_id_sync4            <= ret_axi_id_sync3           ;
            ret_last_sync4              <= ret_last_sync3             ; 
            ret_ready_sync4             <= ret_ready_sync3            ;
            entry_valid_for_debug_sync4 <= entry_valid_for_debug_sync3;
        end
    end

 ila_p190 mila_rd_mng
 (
  .clk(clk),
  .probe0(
//1+ 1+ 6+ 1+ 1+ 5+ 1+ 6+ 1+ 5+ 1+ 1+ 64 = 94
    {
     rst_n                          ,//1+  //
     rsv_counter_sync4           , 
     ret_counter_sync4           , 
     ret_idle_counter_sync4      , 
     rsv_valid_sync4             ,//1+
     rsv_tag_sync4               ,//6+
     rsv_last_sync4              ,//1+
     rsv_first_sync4             ,//1+ 
     rsv_axi_id_sync4            ,//5+
     rsp_valid_sync4             ,//1+
     rsp_tag_sync4               ,//6+
     ret_valid_sync4       ,//1+
     ret_axi_id_sync4            ,//5+
     ret_last_sync4              ,//1+ 
     ret_ready_sync4             ,//1+
     entry_valid_for_debug_sync4  //64+
    }
  )
 );

`endif


endmodule
