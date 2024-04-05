//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
//
//  Filename      : intra_ctrl.v
//  Author        : Liu Cong
//  Created       : 2014-4
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-07-17 by HLL
//  Description   : lcu size changed into 64x64 (prediction to 64x64 block remains to be added)
//  Modified      : 2014-08-23 by HLL
//  Description   : optional mode for minimal tu size added
//  Modified      : 2014-08-25 by HLL
//  Description   : prediction to u added
//  Modified      : 2014-08-26 by HLL
//  Description   : prediction to v added
//  Modified      : 2014-09-10 by HLL
//  Description   : sel_o modified
//  Modified      : 2014-09-15 by HLL
//  Description   : partition supported
//  Modified      : 2014-10-17 by HLL
//  Description   : mode_uv supported
//  Modified      : 2014-10-19 by HLL
//  Description   : mode_uv fetched from cur_mb
//
//  $Id$
//
//-------------------------------------------------------------------

`include "./enc_defines.v"


module intra_ctrl(
  clk                 ,
  rst_n               ,
  // sys if
  start_i             ,
  done_o              ,
  // pre ctrl if
  pre_min_size_i      ,
  uv_partition_i      ,
  // mode ram if
  md_cena_o           ,
  md_addr_o           ,
  md_data_i           ,
  // intra ref if
  ref_start_o         ,
  ref_done_i          ,
  ref_ready_i         ,
  ref_size_o          ,
  ref_mode_o          ,
  ref_sel_o           ,
  ref_position_o      ,
  // intra pred if
  pre_start_o         ,
  pre_mode_o          ,
  pre_sel_o           ,
  pre_size_o          ,
  pre_i4x4_x_o        ,
  pre_i4x4_y_o
  );


//*** PARAMETER DECLARATION ****************************************************

  localparam PIDLE        = 'd00             ,
             PRE04        = 'd01             ,
             PRE08        = 'd02             ,
             PRE16        = 'd03             ,
             PRE32        = 'd04             ,
             PRE08_U      = 'd05             ,
             PRE08_V      = 'd06             ,
             PRE16_U      = 'd07             ,
             PRE16_V      = 'd08             ,
             PRE32_U      = 'd09             ,
             PRE32_V      = 'd10             ;


//*** INPUT/OUTPUT DECLARATION *************************************************

  input                   clk                ;
  input                   rst_n              ;
  // sys if                                  
  input                   start_i            ;
  output reg              done_o             ;
  // pre ctrl if                             
  input                   pre_min_size_i     ;
  input      [20   : 0]   uv_partition_i     ;
  // mode ram if                             
  output reg              md_cena_o          ;
  output reg [9    : 0]   md_addr_o          ;
  input      [5    : 0]   md_data_i          ;
  // intra ref if                            
  output reg              ref_start_o        ;
  input                   ref_done_i         ;
  input                   ref_ready_i        ;
  output reg [1    : 0]   ref_size_o         ;
  output reg [5    : 0]   ref_mode_o         ;
  output reg [1    : 0]   ref_sel_o          ;
  output reg [7    : 0]   ref_position_o     ;
  // intra pred if                           
  output reg              pre_start_o        ;
  output     [5    : 0]   pre_mode_o         ;
  output     [1    : 0]   pre_sel_o          ;
  output     [1    : 0]   pre_size_o         ;
  output reg [3    : 0]   pre_i4x4_x_o       ;
  output reg [3    : 0]   pre_i4x4_y_o       ;


//************************ REG/WIRE DECLARATION **************************

  reg        [5    : 0]   pre_cnt_r          ;
  reg                     mode_valid_r       ;
  reg        [3    : 0]   state              ;
  reg        [3    : 0]   next_state         ;
                                             
  wire       [7    : 0]   pre_position       ;
  
  reg        [1    : 0]   next_size_r        ;
  wire                    partition_64_w     ;
  wire       [3    : 0]   partition_32_w     ;
  wire       [15   : 0]   partition_16_w     ;
  wire                    is_32_split_w      ;
  wire                    is_16_split_w      ;
  reg        [7    : 0]   next_uv_position_w ;


//*** MAIN BODY ****************************************************************

//--- State Machine --------------------

  // state machine : state
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      state <= PIDLE;
    else begin
      state <= next_state ;
    end
  end

  // state machine : next_state
  always @(*) begin
    next_state = PIDLE;
    case( state )
      PIDLE:     begin    if( start_i ) begin
                            if( pre_min_size_i==1'b0 )                        next_state = PRE04 ;
                            else                                              next_state = PRE08 ;
                          end
                          else                                                next_state = PIDLE ;
                 end
      PRE04:     begin    if( ref_done_i ) begin
                            if( ref_position_o[1:0]==2'b11 )                  next_state = PRE08 ;
                            else                                              next_state = PRE04 ;
                          end
                          else                                                next_state = PRE04 ;
                 end
      PRE08:     begin    if( ref_done_i ) begin
                            if( ref_position_o[3:0]==4'b1100 )                next_state = PRE16 ;
                            else begin
                              if( pre_min_size_i==1'b0 )                      next_state = PRE04 ;
                              else                                            next_state = PRE08 ;
                            end
                          end
                          else                                                next_state = PRE08 ;
                 end
      PRE16:     begin    if( ref_done_i ) begin
                            if( ref_position_o[5:0]==6'b110000 )              next_state = PRE32 ;
                            else begin
                              if( pre_min_size_i == 1'b0 )                    next_state = PRE04 ;
                              else                                            next_state = PRE08 ;
                            end
                          end
                          else                                                next_state = PRE16 ;
                 end
      PRE32:     begin    if( ref_done_i ) begin
                            if( ref_position_o[7:0]==8'b11000000 ) begin
                              case( next_size_r )
                                2'b01   :                                     next_state = PRE08_U ;
                                2'b10   :                                     next_state = PRE16_U ;
                                2'b11   :                                     next_state = PRE32_U ;
                                default :                                     next_state = PIDLE ;
                              endcase
                            end
                            else begin
                              if( pre_min_size_i==1'b0 )                      next_state = PRE04 ;
                              else                                            next_state = PRE08 ;
                            end
                          end
                          else                                                next_state = PRE32 ;
                 end
      PRE08_U:   begin    if( ref_done_i )                                    next_state = PRE08_V ;
                          else begin                                          next_state = PRE08_U ;
                          end
                 end
      PRE08_V:   begin    if( ref_done_i ) begin
                            if( ref_position_o[7:0]==8'b11111100 )            next_state = PIDLE ;
                            else begin
                              case( next_size_r )
                                2'b01   :                                     next_state = PRE08_U ;
                                2'b10   :                                     next_state = PRE16_U ;
                                2'b11   :                                     next_state = PRE32_U ;
                                default :                                     next_state = PIDLE ;
                              endcase
                            end
                          end
                          else                                                next_state = PRE08_V ;
                 end
      PRE16_U:   begin    if( ref_done_i )                                    next_state = PRE16_V ;
                          else begin                                          next_state = PRE16_U ;
                          end
                 end
      PRE16_V:   begin    if( ref_done_i ) begin
                            if( ref_position_o[7:0]==8'b11110000 )            next_state = PIDLE ;
                            else begin
                              case( next_size_r )
                                2'b01   :                                     next_state = PRE08_U ;
                                2'b10   :                                     next_state = PRE16_U ;
                                2'b11   :                                     next_state = PRE32_U ;
                                default :                                     next_state = PIDLE ;
                              endcase
                            end
                          end
                          else                                                next_state = PRE16_V ;
                 end
      PRE32_U:   begin    if( ref_done_i )                                    next_state = PRE32_V ;
                          else begin                                          next_state = PRE32_U ;
                          end
                 end
      PRE32_V:   begin    if( ref_done_i ) begin
                            if( ref_position_o[7:0]==8'b11000000 )            next_state = PIDLE ;
                            else begin
                              case( next_size_r )
                                2'b01   :                                     next_state = PRE08_U ;
                                2'b10   :                                     next_state = PRE16_U ;
                                2'b11   :                                     next_state = PRE32_U ;
                                default :                                     next_state = PIDLE ;
                              endcase
                            end
                          end
                          else                                                next_state = PRE32_V ;
                 end
    endcase
  end

//--- Partition Part -------------------

  // next_size_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      next_size_r <= 'd0 ;
    else if( !is_32_split_w )
      next_size_r <= 2'b11 ;
    else if( !is_16_split_w )
      next_size_r <= 2'b10 ;
    else begin
      next_size_r <= 2'b01 ;
    end
  end

  // is_split_w
  assign is_32_split_w = partition_32_w >> ( next_uv_position_w >> 6 ) ;
  assign is_16_split_w = partition_16_w >> ( next_uv_position_w >> 4 ) ;

  // partition_w
  assign { partition_16_w, partition_32_w ,partition_64_w } = uv_partition_i ;

  // next_uv_position_w
  always @(*) begin
    if( ref_sel_o==2'b00 )
      next_uv_position_w = 'd0 ;
    else begin
      case( ref_size_o )
        2'b00   : next_uv_position_w = ref_position_o + 'd04 ;
        2'b01   : next_uv_position_w = ref_position_o + 'd16 ;
        2'b10   : next_uv_position_w = ref_position_o + 'd64 ;
        default : next_uv_position_w = 'dx ;
      endcase
    end
  end


//--- System Part ----------------------

  // done_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      done_o <= 'd0 ;
    else if( done_o )
      done_o <= 'd0 ;
    else if( (ref_done_i) && ( ((state==PRE08_V)&&(ref_position_o[7:0]==8'b11111100)) ||
                               ((state==PRE16_V)&&(ref_position_o[7:0]==8'b11110000)) ||
                               ((state==PRE32_V)&&(ref_position_o[7:0]==8'b11000000)) ||
                               ((state==PRE32  )&&(ref_position_o[7:0]==8'b11000000))&&(next_size_r==2'b00)
                             )
           ) begin
      done_o <= 'd1 ;
    end
  end


//--- Mode Part ------------------------

  // md_cena_o
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      md_cena_o <= 'd0;
    else begin
      if( md_cena_o ) begin
        md_cena_o <= 'd0;
      end
      else begin
        if( state==PIDLE ) begin
          if( start_i ) begin
            md_cena_o <= 'd1;
          end
        end
        else begin
          if( ref_done_i ) begin
             case( state )
               PRE08_U ,
               PRE16_U ,
               PRE32_U :    md_cena_o <= 'd0 ;
               default :    md_cena_o <= 'd1 ;
             endcase
          end
        end
      end
    end
  end

  // md_addr_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      md_addr_o <= 'd0;
    else begin
      if( state==PIDLE ) begin
        if( start_i ) begin
          md_addr_o <= 'd0;
        end
      end
      else begin
        if( ref_done_i ) begin
          if( (ref_sel_o!=2'b00) || ((state==PRE32)&&(ref_position_o[7:0]==8'b11000000)) )
            if( pre_min_size_i==1'b0 )
              case( next_size_r )
                2'b01 : md_addr_o <= next_uv_position_w[7:6] + next_uv_position_w[7:4] + next_uv_position_w[7:2]*5 + 4 ;
                2'b10 : md_addr_o <= next_uv_position_w[7:6] + next_uv_position_w[7:4]*21 + 20;
                2'b11 : md_addr_o <= next_uv_position_w[7:6]*85 + 84 ;
              endcase
            else begin
              case( next_size_r )
                2'b01 : md_addr_o <= next_uv_position_w[7:6] + next_uv_position_w[7:4] + next_uv_position_w[7:2] ;
                2'b10 : md_addr_o <= next_uv_position_w[7:6] + next_uv_position_w[7:4]*5 + 4 ;
                2'b11 : md_addr_o <= next_uv_position_w[7:6]*21 + 20;                         
              endcase
            end
          else begin
            md_addr_o <= md_addr_o + 'd1 ;
          end
        end
      end
    end
  end


//--- Ref Part -------------------------

  // ref_start_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      ref_start_o <= 'd0 ;
    end
    else begin
      if( ref_start_o ) begin
        ref_start_o <= 'd0 ;
      end
      else begin
        if( state==PIDLE ) begin
          if( start_i ) begin
            ref_start_o <= 'd1 ;
          end
        end
        else begin
          if( ref_done_i && ( ! ((state==PRE08_V)&&(ref_position_o[7:0]==8'b11111100)) )
                         && ( ! ((state==PRE16_V)&&(ref_position_o[7:0]==8'b11110000)) )
                         && ( ! ((state==PRE32_V)&&(ref_position_o[7:0]==8'b11000000)) )
                         && ( ! ((state==PRE32  )&&(ref_position_o[7:0]==8'b11000000)&&(next_size_r==2'b00)) )
            ) begin
            ref_start_o <= 'd1 ;
          end
        end
      end
    end
  end

  // ref_size_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      ref_size_o <= 2'b00 ;
    end
    else begin
      case( next_state )
        PRE04 ,PRE08_U ,PRE08_V :    ref_size_o <= 2'b00 ;
        PRE08 ,PRE16_U ,PRE16_V :    ref_size_o <= 2'b01 ;
        PRE16 ,PRE32_U ,PRE32_V :    ref_size_o <= 2'b10 ;
        PRE32                   :    ref_size_o <= 2'b11 ;
      endcase
    end
  end

//******************************************************************************
/* FOR DEBUG
  // ref_size_r
  reg [1:0] ref_size_r ;
  wire      ref_size_d ;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      ref_size_r <= 2'b00 ;
    end
    else begin
      case( state )
        PIDLE: begin    if( start_i ) begin
                          if( pre_min_size_i==1'b0 )                      ref_size_r <= 2'b00 ;
                          else                                            ref_size_r <= 2'b01 ;
                        end
               end
        PRE04: begin    if( ref_done_i )
                          if( ref_position_o[1:0]==2'b11 )                ref_size_r <= 2'b01 ;
                          else                                            ref_size_r <= 2'b00 ;
               end
        PRE08: begin    if( ref_done_i ) begin
                          if( ref_position_o[3:0]==4'b1100 )              ref_size_r <= 2'b10 ;
                          else begin
                            if( pre_min_size_i==1'b0 )                    ref_size_r <= 2'b00 ;
                            else                                          ref_size_r <= 2'b01 ;
                          end
                        end
               end
        PRE16: begin    if( ref_done_i ) begin
                          if( ref_position_o[5:0]==6'b110000 )            ref_size_r <= 2'b11 ;
                          else begin
                            if( pre_min_size_i==1'b0 )                    ref_size_r <= 2'b00 ;
                            else                                          ref_size_r <= 2'b01 ;
                          end
                        end
               end
        PRE32: begin    if( ref_done_i ) begin
                          if( pre_min_size_i==1'b0 )                      ref_size_r <= 2'b00 ;
                          else                                            ref_size_r <= 2'b01 ;
                        end
               end
      endcase
    end
  end
  assign ref_size_d = ref_size_r != ref_size_o ;
*/
//******************************************************************************

  // ref_mode_o : mode_valid_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      mode_valid_r <= 'd0 ;
    else begin
      mode_valid_r <= md_cena_o ;
    end
  end

  // ref_mode_o : ref_mode_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      ref_mode_o <= 'd0 ;
    else begin
      if( mode_valid_r ) begin
        ref_mode_o <= md_data_i ;
      end
    end
  end
  
  // ref_sel_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      ref_sel_o <= 'd0 ;
    else begin
      case( next_state )
        PRE04  ,PRE08  ,PRE16  ,PRE32   : ref_sel_o <= 2'b00 ;
                PRE08_U,PRE16_U,PRE32_U : ref_sel_o <= 2'b10 ;
                PRE08_V,PRE16_V,PRE32_V : ref_sel_o <= 2'b11 ;
        default                         : ref_sel_o <= 2'b00 ;
      endcase
    end
  end

  // ref_position_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      ref_position_o <= 'd0 ;
    else begin
      if( ref_sel_o==2'b00 ) begin
        case( state )
          PIDLE :   begin   if( start_i )                               ref_position_o <= 'd0 ;
                    end
          PRE04 :   begin   if( ref_done_i ) begin
                              if( ref_position_o[1:0]==2'b11 )          ref_position_o <= ref_position_o - 'd03 ;
                              else                                      ref_position_o <= ref_position_o + 'd01 ;
                            end
                    end
          PRE08 :   begin   if( ref_done_i ) begin
                              if( ref_position_o[3:0]==4'b1100 )        ref_position_o <= ref_position_o - 'd12 ;
                              else                                      ref_position_o <= ref_position_o + 'd04 ;
                            end
                    end
          PRE16 :   begin   if( ref_done_i ) begin
                              if( ref_position_o[5:0]==6'b110000 )      ref_position_o <= ref_position_o - 'd48 ;
                              else                                      ref_position_o <= ref_position_o + 'd16 ;
                            end
                    end
          PRE32 :   begin   if( ref_done_i ) begin
                              if( ref_position_o[7:0]==8'b11000000 )    ref_position_o <= 'd0 ;
                              else                                      ref_position_o <= ref_position_o + 'd64 ;
                            end
                    end
        endcase
      end
      else begin
        if( ref_done_i ) begin
          case( state )
            PRE08_V:  begin   if( ref_position_o[7:0]==8'b11111100 )    ref_position_o <= 'd0 ;                    // 252
                              else                                      ref_position_o <= ref_position_o + 'd04 ;
                      end
            PRE16_V:  begin   if( ref_position_o[7:0]==8'b11110000 )    ref_position_o <= 'd0 ;                    // 240
                              else                                      ref_position_o <= ref_position_o + 'd16 ;
                      end
            PRE32_V:  begin   if( ref_position_o[7:0]==8'b11000000 )    ref_position_o <= 'd0 ;                    // 192
                              else                                      ref_position_o <= ref_position_o + 'd64 ;
                      end
          endcase
        end
      end
    end
  end


//--- Pre Part -------------------------

  // pre_start_o : pre_cnt_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      pre_cnt_r <= 'd0 ;
    end
    else begin
      if( ref_ready_i ) begin
        pre_cnt_r <= 'd0 ;
      end
      else begin
        if( pre_start_o )
          pre_cnt_r <= pre_cnt_r+1 ;
      end
    end
  end

  // pre_start_o : pre_start_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      pre_start_o <= 'd0 ;
    end
    else begin
      if( ref_ready_i ) begin
        pre_start_o <= 'd1 ;
      end
      else begin
        case( state )
          PRE04 ,PRE08_U ,PRE08_V:     begin    if( pre_start_o )        pre_start_o <= 'd0;
                                       end
          PRE08 ,PRE16_U ,PRE16_V:     begin    if( pre_cnt_r=='d3 )     pre_start_o <= 'd0;
                                       end
          PRE16 ,PRE32_U ,PRE32_V:     begin    if( pre_cnt_r=='d15 )    pre_start_o <= 'd0;
                                       end
          PRE32:                       begin    if( pre_cnt_r=='d63 )    pre_start_o <= 'd0;
                                       end
        endcase
      end
    end
  end

  // pre_mode_o
  assign pre_mode_o = ref_mode_o ;

  // pre_sel_o
  assign pre_sel_o = ref_sel_o ;

  // pre_size_o
//  assign pre_size_o = (ref_sel_o==2'b00) ? ref_size_o : (ref_size_o>>1) ;
  assign pre_size_o = ref_size_o ;

  // pre_i4x4_x_o, pre_i4x4_y_o : pre_position
  assign pre_position = (ref_sel_o==2'b00) ? ref_position_o : (ref_position_o>>2) ;

  // pre_i4x4_x_o, pre_i4x4_y_o : pre_i4x4_x_o, pre_i4x4_y_o
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      pre_i4x4_y_o <= 'd0;
      pre_i4x4_x_o <= 'd0;
    end
    else begin
      if(ref_ready_i) begin
        pre_i4x4_y_o <= {pre_position[7], pre_position[5], pre_position[3], pre_position[1]};
        pre_i4x4_x_o <= {pre_position[6], pre_position[4], pre_position[2], pre_position[0]};
      end
      else begin
        if(pre_start_o) begin
          case(pre_size_o)
            2'b01: begin    if(!pre_i4x4_x_o[0])             pre_i4x4_x_o <= pre_i4x4_x_o+1;
                            else begin                       pre_i4x4_x_o <= {pre_position[6], pre_position[4], pre_position[2], pre_position[0]};
                                                             pre_i4x4_y_o <= pre_i4x4_y_o+1;
                            end
                   end
            2'b10: begin    if(pre_i4x4_x_o[1:0]!=2'b11)     pre_i4x4_x_o <= pre_i4x4_x_o+1;
                            else begin                       pre_i4x4_x_o <= {pre_position[6], pre_position[4], pre_position[2], pre_position[0]};
                                                             pre_i4x4_y_o <= pre_i4x4_y_o+1;
                            end
                   end
            2'b11: begin    if(pre_i4x4_x_o[2:0]!=3'b111)    pre_i4x4_x_o <= pre_i4x4_x_o+1;
                            else begin                       pre_i4x4_x_o <= {pre_position[6], pre_position[4], pre_position[2], pre_position[0]};
                                                             pre_i4x4_y_o <= pre_i4x4_y_o+1;
                            end
                   end
          endcase
        end
      end
    end
  end

endmodule