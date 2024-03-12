//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2013, VIPcore Group, Fudan University
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
//  Filename      : top_ctrl.v
//  Author        : Yibo FAN
//  Created       : 2013-12-28
//  Description   : top controller of encoder
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-07-17 by HLL
//  Description   : lcu size changed into 64x64 (prediction to 64x64 block remains to be added)
//  Modified      : 2014-08-23 by HLL
//  Description   : optional mode for minimal tu size added
//  Modified      : 2015-01-22 by HLL
//  Description   : updated for external fetch
//  Modified      : 2015-03-12 by LYH
//  Description   : bug removed (some misuse of enc_start_i modified to enc_done_o)
//  Modified      : 2015-03-12 by HLL
//  Description   : bug removed (the ping-pong buffers in mem_buf controlled by sys_start instead of pre_start)
//  Modified      : 2015-03-21 by HLL
//  Description   : intel state jump enabled
//  Modified      : 2015-09-02 by HLL
//  Description   : db_done_i added
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"


module top_ctrl(
  clk              ,
  rst_n            ,

  sys_x_total_i    ,
  sys_y_total_i    ,
  sys_mode_i       ,
  sys_type_i       ,
  enc_start_i      ,
  enc_done_o       ,

  intra_start_o    ,
  ec_start_o       ,
  fime_start_o     ,
  fme_start_o      ,
  mc_start_o       ,

  intra_done_i     ,
  ec_done_i        ,
  fime_done_i      ,
  fme_done_i       ,
  mc_done_i        ,
  db_done_i        ,

  intra_x_o        ,
  intra_y_o        ,
  ec_x_o           ,
  ec_y_o           ,
  fime_x_o         ,
  fime_y_o         ,
  fme_x_o          ,
  fme_y_o          ,
  mc_x_o           ,
  mc_y_o
);

//*** PARAMETER ****************************************************************

  localparam    IDLE  = 00 ,
                I_S0  = 01 ,
                I_S1  = 02 ,
                I_S2  = 03 ,
                P_S0  = 04 ,
                P_S1  = 05 ,
                P_S2  = 06 ,
                P_S3  = 07 ,
                P_S4  = 08 ,
                P_S5  = 09 ,
                P_S6  = 10 ;

  localparam    INTRA = 0  ,
                INTEL = 1  ;


//*** INPUT/OUTPUT DECLARATION *************************************************

  // global
  input                              clk           ; //clock
  input                              rst_n         ; //reset signal
  // sys config IF
  input      [`PIC_X_WIDTH-1 : 0]    sys_x_total_i ; // Total LCU number-1 in X
  input      [`PIC_Y_WIDTH-1 : 0]    sys_y_total_i ; // Total LCU number-1 in y
  input                              sys_mode_i    ; // encoder mode
  input                              sys_type_i    ; // encoder Type
  input                              enc_start_i   ; // start to encode a frame
  output reg                         enc_done_o    ; // encode a frame done
  // output start
  output reg                         intra_start_o ; // start intra prediction
  output reg                         ec_start_o    ; // start entropy coding
  output reg                         fime_start_o  ; // start entropy coding
  output reg                         fme_start_o   ; // start entropy coding
  output reg                         mc_start_o    ; // start entropy coding
  // input done
  input                              intra_done_i  ; // load done
  input                              ec_done_i     ; // intra done
  input                              fime_done_i   ; // entropy coding done
  input                              fme_done_i    ;
  input                              mc_done_i     ;
  input                              db_done_i     ;
  // output x y
  output     [`PIC_X_WIDTH-1 : 0]    intra_x_o     ; // mb x intra prediction
  output     [`PIC_Y_WIDTH-1 : 0]    intra_y_o     ; // mb y intra prediction
  output reg [`PIC_X_WIDTH-1 : 0]    ec_x_o        ; // mb x entropy coding
  output reg [`PIC_Y_WIDTH-1 : 0]    ec_y_o        ; // mb y entropy coding
  output     [`PIC_X_WIDTH-1 : 0]    fime_x_o      ;
  output     [`PIC_Y_WIDTH-1 : 0]    fime_y_o      ;
  output reg [`PIC_X_WIDTH-1 : 0]    fme_x_o       ;
  output reg [`PIC_Y_WIDTH-1 : 0]    fme_y_o       ;
  output reg [`PIC_X_WIDTH-1 : 0]    mc_x_o        ;
  output reg [`PIC_Y_WIDTH-1 : 0]    mc_y_o        ;


//*** WIRE/REG DECLARATION *****************************************************

  reg        [3              : 0]    next_state      ;
  reg        [3              : 0]    curr_state      ;    // it's wire
  reg                                intra_working   ;    // it's wire
  reg                                ec_working      ;    // it's wire
  reg                                fime_working    ;    // it's wire
  reg                                fme_working     ;    // it's wire
  reg                                mc_working      ;    // it's wire
  reg                                intra_done_flag ;
  reg                                ec_done_flag    ;
  reg                                fime_done_flag  ;
  reg                                fme_done_flag   ;
  reg                                mc_done_flag    ;
  reg                                db_done_flag    ;
  reg                                done_flag       ;

  reg        [`PIC_X_WIDTH-1 : 0]    first_x_o       ;
  reg        [`PIC_Y_WIDTH-1 : 0]    first_y_o       ;


//*** MAIN BODY ****************************************************************

//*** FSM ******************************
  // curr state
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      curr_state <= IDLE ;
    else begin
      curr_state <= next_state ;
    end
  end

  // next state
  always @(*) begin
    case(curr_state)
       IDLE   :     begin    if( enc_start_i )
                               if( sys_type_i==INTRA )
                                 next_state = I_S0 ;
                               else begin
                                 next_state = P_S0 ;
                               end
                             else begin
                               next_state = IDLE ;
                             end
                    end
       I_S0   :     begin    if( enc_start_i )
                               next_state = I_S1 ;
                             else begin
                               next_state = I_S0 ;
                             end
                    end
       I_S1   :     begin    if( enc_start_i & (first_x_o==sys_x_total_i) & (first_y_o==sys_y_total_i) )
                               next_state = I_S2 ;
                             else begin
                               next_state = I_S1 ;
                             end
                    end
       I_S2   :     begin    if( enc_done_o )
                               next_state = IDLE ;
                             else begin
                               next_state = I_S2 ;
                             end
                    end
       P_S0   :     begin    if( enc_start_i )
                               next_state = P_S1 ;
                             else begin
                               next_state = P_S0 ;
                             end
                    end
       P_S1   :     begin    if( enc_start_i )
                               next_state = P_S2 ;
                             else begin
                               next_state = P_S1 ;
                             end
                    end
       P_S2   :     begin    if( enc_start_i )
                               next_state = P_S3 ;
                             else begin
                               next_state = P_S2 ;
                             end
                    end
       P_S3   :     begin    if( enc_start_i & (first_x_o==sys_x_total_i) & (first_y_o==sys_y_total_i) )
                               next_state = P_S4 ;
                             else begin
                               next_state = P_S3 ;
                             end
                    end
       P_S4   :     begin    if( enc_start_i )
                               next_state = P_S5 ;
                             else begin
                               next_state = P_S4 ;
                             end
                    end
       P_S5   :     begin    if( enc_start_i )
                               next_state = P_S6 ;
                             else begin
                               next_state = P_S5 ;
                             end
                    end
       P_S6   :     begin    if( enc_done_o )
                               next_state = IDLE ;
                             else begin
                               next_state = P_S6 ;
                             end
                    end
       default:     begin    next_state = IDLE ;
                    end
    endcase
  end


//*** START ****************************
  // intra_start
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      intra_start_o <= 0 ;
    else if( enc_start_i )
      intra_start_o <= intra_working ;
    else begin
      intra_start_o <= 0 ;
    end
  end

  // ec_start
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      ec_start_o <= 0 ;
    else if( enc_start_i )
      ec_start_o <= ec_working ;
    else begin
      ec_start_o <= 0 ;
    end
  end

  // fime start
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      fime_start_o <= 0 ;
    else if( enc_start_i )
      fime_start_o <= fime_working ;
    else begin
      fime_start_o <= 0 ;
    end
  end

  // fme start
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      fme_start_o <= 0 ;
    else if( enc_start_i )
      fme_start_o <= fme_working ;
    else begin
      fme_start_o <= 0 ;
    end
  end

  // mc start
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      mc_start_o <= 0 ;
    else if( enc_start_i )
      mc_start_o <= mc_working ;
    else begin
      mc_start_o <= 0 ;
    end
  end

  // whether to start
  always @(*)begin
    intra_working   = 0 ;
    ec_working      = 0 ;

    fime_working    = 0 ;
    fme_working     = 0 ;
    mc_working      = 0 ;
    ec_working      = 0 ;
    case(next_state)
      IDLE   : { intra_working, fime_working ,fme_working ,mc_working ,ec_working } = 2'b00 ;

      I_S0   : { intra_working, ec_working } = 2'b10 ;
      I_S1   : { intra_working, ec_working } = 2'b11 ;
      I_S2   : { intra_working, ec_working } = 2'b01 ;

      P_S0   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b1000 ;
      P_S1   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b1100 ;
      P_S2   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b1110 ;
      P_S3   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b1111 ;
      P_S4   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b0111 ;
      P_S5   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b0011 ;
      P_S6   : { fime_working ,fme_working ,mc_working ,ec_working } = 4'b0001 ;

      default: { intra_working, fime_working ,fme_working ,mc_working ,ec_working } = 5'b00000 ;
    endcase
  end


//*** DONE *****************************
  // intra done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      intra_done_flag <= 1'b0;
    else if ( intra_done_i )
      intra_done_flag <= 1'b1;
    else if ( enc_done_o ) begin
      intra_done_flag <= 1'b0;
    end
  end

  // ec done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      ec_done_flag <= 1'b0;
    else if ( ec_done_i )
      ec_done_flag <= 1'b1;
    else if ( enc_done_o ) begin
      ec_done_flag <= 1'b0;
    end
  end

  // fime done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      fime_done_flag <= 1'b0;
    else if ( fime_done_i )
      fime_done_flag <= 1'b1;
    else if ( enc_done_o ) begin
      fime_done_flag <= 1'b0;
    end
  end

  // fme done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      fme_done_flag <= 1'b0;
    else if ( fme_done_i )
      fme_done_flag <= 1'b1;
    else if ( enc_done_o ) begin
      fme_done_flag <= 1'b0;
    end
  end

  // mc done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      mc_done_flag <= 1'b0;
    else if ( mc_done_i )
      mc_done_flag <= 1'b1;
    else if ( enc_done_o ) begin
      mc_done_flag <= 1'b0;
    end
  end

  // mc done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      db_done_flag <= 1'b0;
    else if ( db_done_i )
      db_done_flag <= 1'b1;
    else if ( enc_done_o ) begin
      db_done_flag <= 1'b0;
    end
  end

  // done
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      done_flag <= 1'b0 ;
    else if ( curr_state==IDLE )
      done_flag <= 1'b0 ;
    else if ( enc_done_o )
      done_flag <= 1'b1 ;
    else if ( enc_start_i ) begin
      done_flag <= 1'b0 ;
    end
  end

  // enc_done_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
                                                                                                                         enc_done_o <= 0 ;
    else case( curr_state )
       IDLE   :                                                                                                          enc_done_o <= 0 ;
       I_S0   :     if( (!enc_done_o) & intra_done_flag )                                                                enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       I_S1   :     if( (!enc_done_o) & intra_done_flag & ec_done_flag )                                                 enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       I_S2   :     if( (!enc_done_o) & ec_done_flag )                                                                   enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S0   :     if( (!enc_done_o) & fime_done_flag )                                                                 enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S1   :     if( (!enc_done_o) & fime_done_flag & fme_done_flag )                                                 enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S2   :     if( (!enc_done_o) & fime_done_flag & fme_done_flag & mc_done_flag )                                  enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S3   :     if( (!enc_done_o) & fime_done_flag & fme_done_flag & mc_done_flag & ec_done_flag & db_done_flag )    enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S4   :     if( (!enc_done_o) & fme_done_flag & mc_done_flag & ec_done_flag & db_done_flag )                     enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S5   :     if( (!enc_done_o) & mc_done_flag & ec_done_flag & db_done_flag )                                     enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
       P_S6   :     if( (!enc_done_o) & ec_done_flag & db_done_flag )                                                    enc_done_o <= 1 ;
                    else                                                                                                 enc_done_o <= 0 ;
    endcase
  end


//*** X & Y ****************************
  // first x y
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )begin
      first_x_o <= 0;
      first_y_o <= 0;
    end
    else if( curr_state == IDLE )begin
      first_x_o <= 0 ;
      first_y_o <= 0 ;
    end
    else if( enc_start_i )begin
      if(first_x_o == sys_x_total_i)begin
        first_x_o <= 0 ;
        if (first_y_o == sys_y_total_i)
          first_y_o <= 0 ;
        else begin
          first_y_o <= first_y_o + 1 ;
        end
      end
      else begin
        first_x_o <= first_x_o + 1 ;
        first_y_o <= first_y_o ;
      end
    end
  end

  // intra x y
  assign intra_x_o = first_x_o ;
  assign intra_y_o = first_y_o ;

  // ec x y
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      ec_x_o <= 0;
      ec_y_o <= 0;
    end
    else if( curr_state==IDLE )begin
      ec_x_o <= 0;
      ec_y_o <= 0;
    end
    else if( enc_start_i )begin
      if( sys_type_i==INTRA ) begin
        ec_x_o <= intra_x_o;
        ec_y_o <= intra_y_o;
      end
      else begin
        ec_x_o <= mc_x_o;
        ec_y_o <= mc_y_o;
      end
    end
  end

  // fime x y
  assign fime_x_o = first_x_o ;
  assign fime_y_o = first_y_o ;

  // fme x y
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      fme_x_o <= 0;
      fme_y_o <= 0;
    end
    else if( curr_state==IDLE )begin
      fme_x_o <= 0;
      fme_y_o <= 0;
    end
    else if( enc_start_i )begin
      fme_x_o <= fime_x_o;
      fme_y_o <= fime_y_o;
    end
  end

  // mc x y
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      mc_x_o <= 'b0;
      mc_y_o <= 'b0;
    end
    else if( curr_state==IDLE )begin
      mc_x_o <= 'b0;
      mc_y_o <= 'b0;
    end
    else if( enc_start_i )begin
      mc_x_o <= fme_x_o;
      mc_y_o <= fme_y_o;
    end
  end

endmodule
