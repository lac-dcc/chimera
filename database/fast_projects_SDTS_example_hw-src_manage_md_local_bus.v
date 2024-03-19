//local bus module,can write or read;
//by ZQ 20110916;
module local_bus(
     clk,
     reset,
     
     cs_n,//local bus;
     rd_wr,//only write,no read;
     ack_n,
     data,
     data_out,
     ale,
     port0_select,
     port1_select,
     port2_select,
     port3_select,
     port1_check,
     port2_check
    );
     input clk;
     input reset;
     
     input cs_n;
     input rd_wr;
     output ack_n;
     input [31:0]data;//;
     output [31:0]data_out;
     input ale;
     output port0_select;
     output port1_select;
     output port2_select;
     output port3_select;
     output [31:0]port1_check;
     output [31:0]port2_check;
     
     reg [31:0]data_out;
     wire [31:0]data;
     reg ack_n;
     
     reg [27:0]local_bus_address_reg;
///////////////////UM register//////////////////////    
     reg [31:0]test0;
     reg [31:0]test1;
     reg [31:0]test2;
     reg [31:0]test3;
     reg [31:0]test4;
     reg [31:0]test5;
     reg  port0_select;
     reg  port1_select;
     reg  port2_select;
     reg  port3_select;
     reg [31:0]port1_check;
	  reg [31:0]port2_check;

///////////////////end of UM register//////////////////////   
     reg [2:0]current_state;
     parameter idle=3'b0,
               wait_ale0=3'b001,//wait the ale change to 0;
               juedge_um=3'b010,
               um_register=3'b011,
               wait_wrreg_cs=3'b100,
               wait_rdreg_cs=3'b101,
               cancel_ack=3'b0110,
               cancel_command=3'b111;
            
always@(posedge clk or negedge reset)
     if(!reset)
       begin
           ack_n<=1'b1; 
           test0<=32'd20110704;   
           test1<=32'd20110704;  
           test2<=32'd20110704;  
           test3<=32'd20110704;  
           test4<=32'd20110704;  
           test5<=32'd20110704;  
           port0_select<=1'b0;  
           port1_select<=1'b0;  
           port2_select<=1'b0;  
           port3_select<=1'b0;         
           port1_check <=32'h4;//????64
           port2_check <=32'h4;//????64         
           current_state <=idle;
       end
     else
       begin
           case(current_state)
              idle:
                  begin
                      if(ale==1'b1)//address locked signal is coming;
                        begin
                           current_state<=wait_ale0;
                        end
                      else
                        current_state<=idle;
                  end//end idle;
              wait_ale0://wait ale==1'b0;
                  begin
                      if(ale==1'b0)
                        begin
                           case(data[31:28])////
                             4'b0001://um RAM and registers;
                                begin
                                   local_bus_address_reg<=data[27:0];//data[27:26]:00-register;01-RAM;////
                                   current_state<=juedge_um;
                                end
                             default:
                                begin
                                   current_state<=idle;
                                end
                           endcase//end case;
                        end
                      else
                        begin
                            //data_in_reg<=data_in;/////
                            current_state<=wait_ale0;
                        end
                  end//end wait ale==1'b0;
              juedge_um:
                  begin
                     case(local_bus_address_reg[27:26])
                       2'b00:
                         begin
                            current_state<=um_register;//UM register;
                         end
                       default:
                         begin
                            current_state<=idle;
                         end
                     endcase
                  end//juedge_um;
              um_register:
                  begin
                     if(rd_wr==1'b0)//write;
                       begin
                          current_state<=wait_wrreg_cs;
                       end
                     else
                       begin
                          current_state<=wait_rdreg_cs;
                       end
                  end//um_register;
              wait_wrreg_cs:
                  begin
                     if(cs_n==1'b0)//ok
                       begin
                          case(local_bus_address_reg[7:0])
                            8'h00:
                              begin
                                 test0<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h01:
                              begin
                                 test1<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h02:
                              begin
                                 test2<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h03:
                              begin
                                 test3<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h04:
                              begin
                                 test4<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h05:
                              begin
                                 test5<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h06:
                              begin
                                 port0_select<=data[0];
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h07:
                              begin
                                 port1_select<=data[0];
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h08:
                              begin
                                 port2_select<=data[0];
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h09:
                              begin
                                 port3_select<=data[0];
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h0a:
                              begin
                                 port1_check<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                              8'h0b:
                              begin
                                 port2_check<=data;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            default:
                              current_state<=idle;
                          endcase
                       end
                     else
                       begin
                          current_state<=wait_wrreg_cs;
                       end
                  end//wait_wr_cs;
              wait_rdreg_cs:
                  begin
                     if(cs_n==1'b0)//ok
                       begin
                          case(local_bus_address_reg[7:0])
                            8'h00:
                              begin
                                 data_out<=test0;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h01:
                              begin
                                 data_out<=test1;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h02:
                              begin
                                 data_out<=test2;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h03:
                              begin
                                 data_out<=test3;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h04:
                              begin
                                 data_out<=test4;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h05:
                              begin
                                 data_out<=test5;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h06:
                              begin
                                 data_out<=port0_select;
                                 data_out[31:1]<=31'b0;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h07:
                              begin
                                 data_out[0]<=port1_select;
                                 data_out[31:1]<=31'b0;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h08:
                              begin
                                 data_out<=port2_select;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h09:
                              begin
                                 data_out<=port3_select;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            8'h0a:
                              begin
                                 data_out<=port1_check;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                               8'h0b:
                              begin
                                 data_out<=port2_check;
                                 ack_n<=1'b1;
                                 current_state<=cancel_ack;
                              end
                            default:
                              current_state<=idle;
                          endcase
                       end
                     else
                       begin
                          current_state<=wait_rdreg_cs;
                       end
                  end//wait_rd_cs;
              cancel_ack:
                  begin
                     local_bus_address_reg<=28'b0;
                     ack_n<=1'b0;
                     current_state<=cancel_command;
                  end//cancel_ack;
              cancel_command:
                  begin
                     if(cs_n==1'b1)
                       begin
                          ack_n<=1'b1;
                          current_state<=idle;
                       end
                     else
                       begin
                          current_state<=cancel_command;
                       end
                  end//cancel_command;
              default:
                  begin
                      current_state<=idle;
                  end
           endcase
       end 
endmodule
