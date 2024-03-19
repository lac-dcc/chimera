//cdp local bus;
//
module cdp_local_bus(
    clk,
    clk_25m_core, 
    reset,
    
    cs_n,//local bus;
    rd_wr,//only write,no read;
    ack_n,
    data,
    data_out,
    ale,
    
    port_receive0,
    port_discard0,
    port_send0,
    send_clk0,
    
    port_receive1,
    port_discard1,
    port_send1,
    send_clk1,
    
    port_receive2,
    port_discard2,
    port_send2,
    send_clk2,
    
    port_receive3,
    port_discard3,
    port_send3,
    send_clk3,
    
    port_receive4,
    port_discard4,
    port_send4,
    send_clk4,
    
    port_receive5,
    port_discard5,
    port_send5,
    send_clk5,
    
    port_receive6,
    port_discard6,
    port_send6,
    send_clk6,
    
    port_receive7,
    port_discard7,
    port_send7,
    send_clk7,
    
    port_error0,
    port_error1,
    port_error2,
    port_error3,
    port_error4,
    port_error5,
    port_error6,
    port_error7,

    
    port_pream0,
    port_pream1,
    port_pream2,
    port_pream3,
    port_pream4,
    port_pream5,
    port_pream6,
    port_pream7,
    
    gmii_rxclk0,
    gmii_rxclk1,
    gmii_rxclk2,
    gmii_rxclk3,
    gmii_rxclk4,
    gmii_rxclk5,
    gmii_rxclk6,
    gmii_rxclk7,
	 
    FPGA_MAC,
	 FPGA_IP
  );
    //define MAC and ip addr,default mac is 48'h888888888888;default ip is 32'h88888888;
	output [47:0] FPGA_MAC;
    output [31:0] FPGA_IP;	
    
	reg [47:0] FPGA_MAC;
    reg [31:0] FPGA_IP;
	
    input clk;
    input clk_25m_core;
    input reset;
    
    input cs_n;//local bus;
    input rd_wr;//only write,no read;
    output ack_n;
    input [31:0]data;
    output [31:0]data_out;
    input ale;
    
    input port_error0;
    input port_error1;
    input port_error2;
    input port_error3;
    input port_error4;
    input port_error5;
    input port_error6;
    input port_error7;
    
    input port_pream0;
    input port_pream1;
    input port_pream2;
    input port_pream3;
    input port_pream4;
    input port_pream5;
    input port_pream6;
    input port_pream7;
    
    input port_receive0;
    input port_discard0;
    input port_send0;
    input send_clk0;
    
    input port_receive1;
    input port_discard1;
    input port_send1;
    input send_clk1;
    
    input port_receive2;
    input port_discard2;
    input port_send2;
    input send_clk2;
    
    input port_receive3;
    input port_discard3;
    input port_send3;
    input send_clk3;
    
    input port_receive4;
    input port_discard4;
    input port_send4;
    input send_clk4;
    
    input port_receive5;
    input port_discard5;
    input port_send5;
    input send_clk5;
    
    input port_receive6;
    input port_discard6;
    input port_send6;
    input send_clk6;
    
    input port_receive7;
    input port_discard7;
    input port_send7;
    input send_clk7;
    
    input gmii_rxclk0;
    input gmii_rxclk1;
    input gmii_rxclk2;
    input gmii_rxclk3;
    input gmii_rxclk4;
    input gmii_rxclk5;
    input gmii_rxclk6;
    input gmii_rxclk7;

    
    reg [31:0]data_out;
    reg [31:0] error0;
    reg [31:0] error1;
    reg [31:0] error2;
    reg [31:0] error3;
    reg [31:0] error4;
    reg [31:0] error5;
    reg [31:0] error6;
    reg [31:0] error7;

    
    reg [31:0] pream0;
    reg [31:0] pream1;
    reg [31:0] pream2;
    reg [31:0] pream3;
    reg [31:0] pream4;
    reg [31:0] pream5;
    reg [31:0] pream6;
    reg [31:0] pream7;
   
    reg [31:0] pream_reg0;
    reg [31:0] pream_reg1;
    reg [31:0] pream_reg2;
    reg [31:0] pream_reg3;
    reg [31:0] pream_reg4;
    reg [31:0] pream_reg5;
    reg [31:0] pream_reg6;
    reg [31:0] pream_reg7;
    
    reg [31:0] receive0;
    reg [31:0] discard0;
    reg [31:0] send0;
    
    reg [31:0] receive1;
    reg [31:0] discard1;
    reg [31:0] send1;
    
    reg [31:0] receive2;
    reg [31:0] discard2;
    reg [31:0] send2;
    
    reg [31:0] receive3;
    reg [31:0] discard3;
    reg [31:0] send3;
    
    reg [31:0] receive4;
    reg [31:0] discard4;
    reg [31:0] send4;
    
    reg [31:0] receive5;
    reg [31:0] discard5;
    reg [31:0] send5;
    
    reg [31:0] receive6;
    reg [31:0] discard6;
    reg [31:0] send6;
    
    reg [31:0] receive7;
    reg [31:0] discard7;
    reg [31:0] send7;

/////////////////////////
    reg [31:0] error_reg0;
    reg [31:0] error_reg1;
    reg [31:0] error_reg2;
    reg [31:0] error_reg3;
    reg [31:0] error_reg4;
    reg [31:0] error_reg5;
    reg [31:0] error_reg6;
    reg [31:0] error_reg7;
    
    reg [31:0] receive_reg0;
    reg [31:0] discard_reg0;
    reg [31:0] send_reg0;
    
    reg [31:0] receive_reg1;
    reg [31:0] discard_reg1;
    reg [31:0] send_reg1;
    
    reg [31:0] receive_reg2;
    reg [31:0] discard_reg2;
    reg [31:0] send_reg2;
    
    reg [31:0] receive_reg3;
    reg [31:0] discard_reg3;
    reg [31:0] send_reg3;
    
    reg [31:0] receive_reg4;
    reg [31:0] discard_reg4;
    reg [31:0] send_reg4;
    
    reg [31:0] receive_reg5;
    reg [31:0] discard_reg5;
    reg [31:0] send_reg5;
    
    reg [31:0] receive_reg6;
    reg [31:0] discard_reg6;
    reg [31:0] send_reg6;
    
    reg [31:0] receive_reg7;
    reg [31:0] discard_reg7;
    reg [31:0] send_reg7;
    reg rx_clear0;
    reg rx_clear1;
    reg rx_clear2;
    reg rx_clear3;
    reg rx_clear4;
    reg rx_clear5;
    reg rx_clear6;
    reg rx_clear7;
    
    reg tx_clear0;
    reg tx_clear1;
    reg tx_clear2;
    reg tx_clear3;
    reg tx_clear4;
    reg tx_clear5;
    reg tx_clear6;
    reg tx_clear7;
       
/////////////////port0///////////////// gmii_rxclk0
always@(posedge gmii_rxclk0 or negedge reset)
  if(!reset)
    begin
      receive_reg0<=32'b0;
      discard_reg0<=32'b0;
      pream_reg0<=32'b0;
      rx_clear0 <=1'b0;
    end
  else
    begin
    rx_clear0 <=clear_flag;
     if(rx_clear0==1'b0)
       begin
       if(port_receive0==1'b1)//receive a pkt;
         begin
           receive_reg0<=receive_reg0+1'b1;
         end
       else
         begin
           receive_reg0<=receive_reg0;
         end
       if(port_discard0==1'b1)//receive a pkt;
        begin
          discard_reg0<=discard_reg0+1'b1;
        end
       else
        begin
          discard_reg0<=discard_reg0;
        end
       if(port_pream0==1'b1)//pream error a pkt;
        begin
          pream_reg0<=pream_reg0+1'b1;
        end
       else
        begin
          pream_reg0<=pream_reg0;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive0<=receive_reg0;
          discard0<=discard_reg0;
          pream0<=pream_reg0;
        end
      else
        begin
          receive0<=receive0;
          discard0<=discard0;
          pream0<=pream0;
        end
      end//if flag==0;
     else//flag 
      begin
        receive_reg0<=32'b0;
        discard_reg0<=32'b0;
        pream_reg0<=32'b0;
        receive0<=32'b0;
        discard0<=32'b0;
        pream0<=32'b0;
      end
    end

always@(posedge send_clk0 or negedge reset)
  if(!reset)
    begin
      send_reg0<=32'b0;
      tx_clear0 <=1'b0;
    end
  else
    begin
      tx_clear0 <=clear_flag;
      if(tx_clear0==1'b0)
        begin
          if(port_send0==1'b1)//receive a pkt;
            begin
              send_reg0<=send_reg0+1'b1;
            end
          else
            begin
              send_reg0<=send_reg0;
            end
          if(read_flag==1'b0)
            begin
              send0<=send_reg0;
            end
          else
            begin
              send0<=send0;
            end
        end
      else//clear
        begin
          send_reg0<=32'b0;
          send0<=32'b0;
        end
    end
///////////////// end of port0/////////////////    
   
/////////////////port1///////////////// 

always@(posedge gmii_rxclk1 or negedge reset)
  if(!reset)
    begin
      receive_reg1<=32'b0;
      discard_reg1<=32'b0;
      pream_reg1<=32'b0;
      rx_clear1 <=1'b0;
    end
  else
    begin
     rx_clear1 <=clear_flag;
     if(rx_clear1==1'b0)
      begin
      if(port_receive1==1'b1)//receive a pkt;
        begin
          receive_reg1<=receive_reg1+1'b1;
        end
      else
        begin
          receive_reg1<=receive_reg1;
        end
      if(port_discard1==1'b1)//receive a pkt;
        begin
          discard_reg1<=discard_reg1+1'b1;
        end
      else
        begin
          discard_reg1<=discard_reg1;
        end
      if(port_pream1==1'b1)//pream error a pkt;
        begin
          pream_reg1<=pream_reg1+1'b1;
        end
       else
        begin
          pream_reg1<=pream_reg1;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive1<=receive_reg1;
          discard1<=discard_reg1;
          pream1<=pream_reg1;
        end
      else
        begin
          receive1<=receive1;
          discard1<=discard1;
          pream1<=pream1;
        end
     end
     else//flag 
      begin
        receive_reg1<=32'b0;
        discard_reg1<=32'b0;
        receive1<=32'b0;
        discard1<=32'b0;
        pream_reg1<=32'b0;
        pream1<=32'b0;
      end
    end

always@(posedge send_clk1 or negedge reset)
  if(!reset)
    begin
      send_reg1<=32'b0;
      tx_clear1 <=1'b0;
    end
  else
    begin
      tx_clear1 <=clear_flag;
      if(tx_clear1==1'b0)
        begin
          if(port_send1==1'b1)//receive a pkt;
            begin
              send_reg1<=send_reg1+1'b1;
            end
          else
            begin
              send_reg1<=send_reg1;
            end
          if(read_flag==1'b0)
            begin
              send1<=send_reg1;
            end
          else
            begin
              send1<=send1;
            end
        end
      else//clear
        begin
          send_reg1<=32'b0;
          send1<=32'b0;
        end
    end
///////////////// end of port1///////////////// 
   
/////////////////port2///////////////// 

always@(posedge gmii_rxclk2 or negedge reset)
  if(!reset)
    begin
      receive_reg2<=32'b0;
      discard_reg2<=32'b0;
      pream_reg2<=32'b0;
      rx_clear2 <= 1'b0;
    end
  else
    begin
     rx_clear2 <=clear_flag;
     if(rx_clear2==1'b0)
      begin
      if(port_receive2==1'b1)//receive a pkt;
        begin
          receive_reg2<=receive_reg2+1'b1;
        end
      else
        begin
          receive_reg2<=receive_reg2;
        end
      if(port_discard2==1'b1)//receive a pkt;
        begin
          discard_reg2<=discard_reg2+1'b1;
        end
      else
        begin
          discard_reg2<=discard_reg2;
        end
      if(port_pream2==1'b1)//pream error a pkt;
        begin
          pream_reg2<=pream_reg2+1'b1;
        end
       else
        begin
          pream_reg2<=pream_reg2;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive2<=receive_reg2;
          discard2<=discard_reg2;
          pream2<=pream_reg2;
        end
      else
        begin
          receive2<=receive2;
          discard2<=discard2;
          pream2<=pream2;
        end
     end
     else
      begin
        receive_reg2<=32'b0;
        discard_reg2<=32'b0;
        receive2<=32'b0;
        discard2<=32'b0;
        pream_reg2<=32'b0;
        pream2<=32'b0;
      end
    end

always@(posedge send_clk2 or negedge reset)
  if(!reset)
    begin
      send_reg2<=32'b0;
      tx_clear2 <=1'b0;
    end
  else
    begin
      tx_clear2 <=clear_flag;
      if(tx_clear2==1'b0)
        begin
          if(port_send2==1'b1)//receive a pkt;
            begin
              send_reg2<=send_reg2+1'b1;
            end
          else
            begin
              send_reg2<=send_reg2;
            end
          if(read_flag==1'b0)
            begin
              send2<=send_reg2;
            end
          else
            begin
              send2<=send2;
            end
        end
      else//clear
        begin
          send_reg2<=32'b0;
          send2<=32'b0;
        end
    end
///////////////// end of port2///////////////// 
   
/////////////////port3///////////////// 

always@(posedge gmii_rxclk3 or negedge reset)
  if(!reset)
    begin
      receive_reg3<=32'b0;
      discard_reg3<=32'b0;
      pream_reg3<=32'b0;
      rx_clear3<=1'b0;
    end
  else
    begin
    rx_clear3 <=clear_flag;
    if(rx_clear3==1'b0)
      begin
      if(port_receive3==1'b1)//receive a pkt;
        begin
          receive_reg3<=receive_reg3+1'b1;
        end
      else
        begin
          receive_reg3<=receive_reg3;
        end
      if(port_discard3==1'b1)//receive a pkt;
        begin
          discard_reg3<=discard_reg3+1'b1;
        end
      else
        begin
          discard_reg3<=discard_reg3;
        end
      if(port_pream3==1'b1)//pream error a pkt;
        begin
          pream_reg3<=pream_reg3+1'b1;
        end
       else
        begin
          pream_reg3<=pream_reg3;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive3<=receive_reg3;
          discard3<=discard_reg3;
          pream3<=pream_reg3;
        end
      else
        begin
          receive3<=receive3;
          discard3<=discard3;
          pream3<=pream3;
        end
    end
     else
       begin
         receive_reg3<=32'b0;
         discard_reg3<=32'b0;
         receive3<=32'b0;
         discard3<=32'b0;
         pream3<=32'b0;
         pream_reg3<=32'b0;
       end
    end

always@(posedge send_clk3 or negedge reset)
  if(!reset)
    begin
      send_reg3<=32'b0;
      tx_clear3 <=1'b0;
    end
  else
    begin
      tx_clear3 <=clear_flag;
      if(tx_clear3==1'b0)
        begin
          if(port_send3==1'b1)//receive a pkt;
            begin
              send_reg3<=send_reg3+1'b1;
            end
          else
            begin
              send_reg3<=send_reg3;
            end
          if(read_flag==1'b0)
            begin
              send3<=send_reg3;
            end
          else
            begin
              send3<=send3;
            end
        end
      else//clear
        begin
          send_reg3<=32'b0;
          send3<=32'b0;
        end
    end
///////////////// end of port3///////////////// 
   
/////////////////port4///////////////// 

always@(posedge gmii_rxclk4 or negedge reset)
  if(!reset)
    begin
      receive_reg4<=32'b0;
      discard_reg4<=32'b0;
      pream_reg4<=32'b0;
      rx_clear4 <=1'b0;
    end
  else
    begin
    rx_clear4 <=clear_flag;
    if(rx_clear4==1'b0)
      begin
      if(port_receive4==1'b1)//receive a pkt;
        begin
          receive_reg4<=receive_reg4+1'b1;
        end
      else
        begin
          receive_reg4<=receive_reg4;
        end
      if(port_discard4==1'b1)//receive a pkt;
        begin
          discard_reg4<=discard_reg4+1'b1;
        end
      else
        begin
          discard_reg4<=discard_reg4;
        end
      if(port_pream4==1'b1)//pream error a pkt;
        begin
          pream_reg4<=pream_reg4+1'b1;
        end
       else
        begin
          pream_reg4<=pream_reg4;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive4<=receive_reg4;
          discard4<=discard_reg4;
          pream4<=pream_reg4;
        end
      else
        begin
          receive4<=receive4;
          discard4<=discard4;
          pream4<=pream4;
        end
      end
     else
       begin
         receive_reg4<=32'b0;
         discard_reg4<=32'b0;
         receive4<=32'b0;
         discard4<=32'b0;
         pream_reg4<=32'b0;
         pream4<=32'b0;
       end
    end

always@(posedge send_clk4 or negedge reset)
  if(!reset)
    begin
      send_reg4<=32'b0;
      tx_clear4 <=1'b0;
    end
  else
    begin
      tx_clear4 <=clear_flag;
      if(tx_clear4==1'b0)
        begin
          if(port_send4==1'b1)//receive a pkt;
            begin
              send_reg4<=send_reg4+1'b1;
            end
          else
            begin
              send_reg4<=send_reg4;
            end
          if(read_flag==1'b0)
            begin
              send4<=send_reg4;
            end
          else
            begin
              send4<=send4;
            end
        end
      else//clear
        begin
          send_reg4<=32'b0;
          send4<=32'b0;
        end
    end
///////////////// end of port4///////////////// 
   
/////////////////port5///////////////// 

always@(posedge gmii_rxclk5 or negedge reset)
  if(!reset)
    begin
      receive_reg5<=32'b0;
      discard_reg5<=32'b0;
      pream_reg5<=32'b0;
      rx_clear5<=1'b0;
    end
  else
    begin
    rx_clear5 <=clear_flag;
    if(rx_clear5==1'b0)
      begin
      if(port_receive5==1'b1)//receive a pkt;
        begin
          receive_reg5<=receive_reg5+1'b1;
        end
      else
        begin
          receive_reg5<=receive_reg5;
        end
      if(port_discard5==1'b1)//receive a pkt;
        begin
          discard_reg5<=discard_reg5+1'b1;
        end
      else
        begin
          discard_reg5<=discard_reg5;
        end
      if(port_pream5==1'b1)//pream error a pkt;
        begin
          pream_reg5<=pream_reg5+1'b1;
        end
       else
        begin
          pream_reg5<=pream_reg5;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive5<=receive_reg5;
          discard5<=discard_reg5;
          pream5<=pream_reg5;
        end
      else
        begin
          receive5<=receive5;
          discard5<=discard5;
          pream5<=pream5;
        end

     end
     else
       begin
         receive_reg5<=32'b0;
         discard_reg5<=32'b0;
         receive5<=32'b0;
         discard5<=32'b0;
         pream5<=32'b0;
         pream_reg5<=32'b0;
       end
    end

always@(posedge send_clk5 or negedge reset)
  if(!reset)
    begin
      send_reg5<=32'b0;
      tx_clear5<=1'b0;
    end
  else
    begin
      tx_clear5 <=clear_flag;
      if(tx_clear5==1'b0)
        begin
          if(port_send5==1'b1)//receive a pkt;
            begin
              send_reg5<=send_reg5+1'b1;
            end
          else
            begin
              send_reg5<=send_reg5;
            end
          if(read_flag==1'b0)
            begin
              send5<=send_reg5;
            end
          else
            begin
              send5<=send5;
            end
        end
      else//clear
        begin
          send_reg5<=32'b0;
          send5<=32'b0;
        end
    end
///////////////// end of port5///////////////// 
   
/////////////////port6///////////////// 

always@(posedge gmii_rxclk6 or negedge reset)
  if(!reset)
    begin
      receive_reg6<=32'b0;
      discard_reg6<=32'b0;
      pream_reg6<=32'b0;
      rx_clear6<=1'b0;
    end
  else
    begin
    rx_clear6 <=clear_flag;
    if(rx_clear6==1'b0)
      begin
      if(port_receive6==1'b1)//receive a pkt;
        begin
          receive_reg6<=receive_reg6+1'b1;
        end
      else
        begin
          receive_reg6<=receive_reg6;
        end
      if(port_discard6==1'b1)//receive a pkt;
        begin
          discard_reg6<=discard_reg6+1'b1;
        end
      else
        begin
          discard_reg6<=discard_reg6;
        end

      if(port_pream6==1'b1)//pream error a pkt;
        begin
          pream_reg6<=pream_reg6+1'b1;
        end
       else
        begin
          pream_reg6<=pream_reg6;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive6<=receive_reg6;
          discard6<=discard_reg6;
          pream6<=pream_reg6;
        end
      else
        begin
          receive6<=receive6;
          discard6<=discard6;
          pream6<=pream6;
        end
     end
     else
       begin
         receive_reg6<=32'b0;
         discard_reg6<=32'b0;
         receive6<=32'b0;
         discard6<=32'b0;
         pream6<=32'b0;
         pream_reg6<=32'b0;
       end
    end

always@(posedge send_clk6 or negedge reset)
  if(!reset)
    begin
      send_reg6<=32'b0;
      tx_clear6<=1'b0;
    end
  else
    begin
      tx_clear6 <=clear_flag;
      if(tx_clear6==1'b0)
        begin
          if(port_send6==1'b1)//receive a pkt;
            begin
              send_reg6<=send_reg6+1'b1;
            end
          else
            begin
              send_reg6<=send_reg6;
            end
          if(read_flag==1'b0)
            begin
              send6<=send_reg6;
            end
          else
            begin
              send6<=send6;
            end
        end
      else//clear
        begin
          send_reg6<=32'b0;
          send6<=32'b0;
        end
    end
///////////////// end of port6///////////////// 
   
/////////////////port7///////////////// 

always@(posedge gmii_rxclk7 or negedge reset)
  if(!reset)
    begin
      receive_reg7<=32'b0;
      discard_reg7<=32'b0;
      pream_reg7<=32'b0;
      rx_clear7<=1'b0;
    end
  else
    begin
    rx_clear7 <=clear_flag;
    if(rx_clear7==1'b0)
      begin
      if(port_receive7==1'b1)//receive a pkt;
        begin
          receive_reg7<=receive_reg7+1'b1;
        end
      else
        begin
          receive_reg7<=receive_reg7;
        end
      if(port_discard7==1'b1)//receive a pkt;
        begin
          discard_reg7<=discard_reg7+1'b1;
        end
      else
        begin
          discard_reg7<=discard_reg7;
        end
      if(port_pream7==1'b1)//pream error a pkt;
        begin
          pream_reg7<=pream_reg7+1'b1;
        end
       else
        begin
          pream_reg7<=pream_reg7;
        end
      //////read flag/////
      if(read_flag==1'b0)
        begin
          receive7<=receive_reg7;
          discard7<=discard_reg7;
          pream7<=pream_reg7;
        end
      else
        begin
          receive7<=receive7;
          discard7<=discard7;
          pream7<=pream7;
        end
     end
     else
       begin
         receive_reg7<=32'b0;
         discard_reg7<=32'b0;
         receive7<=32'b0;
         discard7<=32'b0;
         pream7<=32'b0;
         pream_reg7<=32'b0;
       end
    end

always@(posedge send_clk7 or negedge reset)
  if(!reset)
    begin
      send_reg7<=32'b0;
      tx_clear7<=1'b0;
    end
  else
    begin
      tx_clear7 <=clear_flag;
      if(tx_clear7==1'b0)
        begin
          if(port_send7==1'b1)//receive a pkt;
            begin
              send_reg7<=send_reg7+1'b1;
            end
          else
            begin
              send_reg7<=send_reg7;
            end
          if(read_flag==1'b0)
            begin
              send7<=send_reg7;
            end
          else
            begin
              send7<=send7;
            end
        end
      else//clear
        begin
          send_reg7<=32'b0;
          send7<=32'b0;
        end
    end
///////////////// end of port7///////////////// 
   
/////////////////error///////////////////////
always@(posedge clk or negedge reset)
  if(!reset)
    begin
      error_reg0<=32'b0;
      error_reg1<=32'b0;
      error_reg2<=32'b0;
      error_reg3<=32'b0;
      error_reg4<=32'b0;
      error_reg5<=32'b0;
      error_reg6<=32'b0;
      error_reg7<=32'b0;
    end
  else
    begin
    if(clear_flag==1'b0)
      begin
      if(port_error0==1'b1)// a error pkt;
        begin
          error_reg0<=error_reg0+1'b1;
        end
      else
        begin
          error_reg0<=error_reg0;
        end
      if(port_error1==1'b1)// a error pkt;
        begin
          error_reg1<=error_reg1+1'b1;
        end
      else
        begin
          error_reg1<=error_reg1;
        end
      if(port_error2==1'b1)// a error pkt;
        begin
          error_reg2<=error_reg2+1'b1;
        end
      else
        begin
          error_reg2<=error_reg2;
        end
      if(port_error3==1'b1)// a error pkt;
        begin
          error_reg3<=error_reg3+1'b1;
        end
      else
        begin
          error_reg3<=error_reg3;
        end
      if(port_error4==1'b1)// a error pkt;
        begin
          error_reg4<=error_reg4+1'b1;
        end
      else
        begin
          error_reg4<=error_reg4;
        end
      if(port_error5==1'b1)// a error pkt;
        begin
          error_reg5<=error_reg5+1'b1;
        end
      else
        begin
          error_reg5<=error_reg5;
        end
      if(port_error6==1'b1)// a error pkt;
        begin
          error_reg6<=error_reg6+1'b1;
        end
      else
        begin
          error_reg6<=error_reg6;
        end
      if(port_error7==1'b1)// a error pkt;
        begin
          error_reg7<=error_reg7+1'b1;
        end
      else
        begin
          error_reg7<=error_reg7;
        end

        
      if(read_flag==1'b0)
        begin
          error0<=error_reg0;
          error1<=error_reg1;
          error2<=error_reg2;
          error3<=error_reg3;
          error4<=error_reg4;
          error5<=error_reg5;
          error6<=error_reg6;
          error7<=error_reg7;
        end
      else//read flag;
        begin
          error0<=error0;
          error1<=error1;
          error2<=error2;
          error3<=error3;
          error4<=error4;
          error5<=error5;
          error6<=error6;
          error7<=error7;
        end
     end
     else//clear flag;
       begin
         error_reg0<=32'b0;
         error_reg1<=32'b0;
         error_reg2<=32'b0;
         error_reg3<=32'b0;
         error_reg4<=32'b0;
         error_reg5<=32'b0;
         error_reg6<=32'b0;
         error_reg7<=32'b0;
         error0<=32'b0;
         error1<=32'b0;
         error2<=32'b0;
         error3<=32'b0;
         error4<=32'b0;
         error5<=32'b0;
         error6<=32'b0;
         error7<=32'b0;
       end
    end//end reset;
////////////////end of error/////////////////

/////////////////end write the tem__reg to reg///////
////////////////rd and wr//////////////
//local bus rd and wr;
    reg [31:0]clear;//clear all reg;
    reg clear_flag;//clear flag;
    reg read_flag;//the us will read the cdp reg,so stop counting;
    reg [3:0]counter;//clear counter 10;
    reg ack_n;
    reg [31:0]data_reg;
	 reg [31:0]mac0_h;
	 reg [31:0]mac0_l;
	 reg [31:0]ip0;
	 
    reg [2:0]current_state;
    parameter idle=3'b0,
              judge_addr=3'b001,
              wait_cs=3'b010,
              enable_ack=3'b011,
              cannel_command=3'b100,
              judge_clear=3'b101;
    
always@(posedge clk or negedge reset)
  if(!reset)
    begin
      ack_n<=1'b1;
      data_out<=32'b0;
      clear<=32'b0;
      clear_flag<=1'b0;
      read_flag<=1'b0;
      counter<=4'b0;
	  
	   FPGA_MAC<=48'b0;//add by bhf  2014.5.26
      FPGA_IP<=32'b0;
	  
	   mac0_h <=32'h0000_7777;//initate port0 mac and ip address
	   mac0_l <=32'h7777_7777;
	   ip0 <=32'h8787_8787;	
      
      current_state<=idle;
    end
  else
    begin
	  FPGA_MAC<={mac0_h[15:0],mac0_l};//output NET_MAGIC_CTRL module
	  FPGA_IP<=ip0;
      case(current_state)
        idle:
          begin
            if(ale==1'b1)
              begin
                data_reg<=data;
                if(rd_wr==1'b1)//read;
                  read_flag<=1'b1;
                else
                  read_flag<=1'b0;
                current_state<=judge_addr;
              end
            else
              begin
                current_state<=idle;
              end
          end//end idle;
        judge_addr:
          begin
            if(ale==1'b0)
              if(data_reg[31:28]==4'b0000)//cdp;
                begin
                  current_state<=wait_cs;
                end
              else
                begin
                  current_state<=idle;
                end
            else
              begin
                current_state<=judge_addr;
              end
          end//end judge_addr;
        wait_cs:
          begin
            if(cs_n==1'b0)//cs;
              begin
                if(rd_wr==1'b1)//0:wr;1:rd;
                  begin
                    case(data_reg[7:0])
                      8'h00:data_out<=clear;
                      8'h01:data_out<=receive0;
                      8'h02:data_out<=discard0;
                      8'h03:data_out<=error0;
                      8'h04:data_out<=send0;
                      
                      8'h05:data_out<=receive1;
                      8'h06:data_out<=discard1;
                      8'h07:data_out<=error1;
                      8'h08:data_out<=send1;
                      
                      8'h09:data_out<=receive2;
                      8'h0a:data_out<=discard2;
                      8'h0b:data_out<=error2;
                      8'h0c:data_out<=send2;
                      
                      8'h0d:data_out<=receive3;
                      8'h0e:data_out<=discard3;
                      8'h0f:data_out<=error3;
                      8'h10:data_out<=send3;
                      
                      8'h11:data_out<=receive4;
                      8'h12:data_out<=discard4;
                      8'h13:data_out<=error4;
                      8'h14:data_out<=send4;
                      
                      8'h15:data_out<=receive5;
                      8'h16:data_out<=discard5;
                      8'h17:data_out<=error5;
                      8'h18:data_out<=send5;
                      
                      8'h19:data_out<=receive6;
                      8'h1a:data_out<=discard6;
                      8'h1b:data_out<=error6;
                      8'h1c:data_out<=send6;
                      
                      8'h1d:data_out<=receive7;
                      8'h1e:data_out<=discard7;
                      8'h1f:data_out<=error7;
                      8'h20:data_out<=send7;
                      
                      8'h21:data_out<=pream0;
                      8'h22:data_out<=pream1;
                      8'h23:data_out<=pream2;
                      8'h24:data_out<=pream3;
                      8'h25:data_out<=pream4;
                      8'h26:data_out<=pream5;
                      8'h27:data_out<=pream6;
                      8'h28:data_out<=pream7;
					  
					  8'h30:data_out <= mac0_l;
					  8'h31:data_out <= mac0_h;//initate port0 mac and ip address
					  8'h32:data_out <= ip0;

                      default:current_state<=idle;
                    endcase
                  end
                else//wr
                  begin
                    case(data_reg[7:0])
                      8'h00:clear<=data;
					  
					 
					  8'h30:mac0_l <= data;
					  8'h31:mac0_h <={16'b0,data[15:0]};//initate port0 mac and ip address
					  8'h32:ip0 <= data;	
                      
                      default:current_state<=idle;
                    endcase
                  end
                ack_n<=1'b1;
                current_state<=judge_clear;
              end
            else
              begin
                current_state<=wait_cs;
              end
          end//end wait_cs;
        judge_clear:

          begin
            if(clear==32'b01)
              begin
                clear_flag<=1'b1;
                clear<=32'b0;
                counter<=counter+1'b1;
              end
            else
              clear_flag<=1'b0;
            current_state<=enable_ack;
          end//wait_clear;
        enable_ack:
          begin
            if(clear_flag==1'b1)//clear;
              begin
                if(counter==4'd10)
                  begin
                    ack_n<=1'b0;
                    counter<=4'b0;
                    clear_flag<=1'b0;
                    current_state<=cannel_command;
                  end
                else
                  begin
                    counter<=counter+1'b1;
                    current_state<=enable_ack;
                  end
              end
            else//not clear;
              begin
                ack_n<=1'b0;
                current_state<=cannel_command;
              end
          end//end cannel_ack;
        cannel_command:
          begin
            if(cs_n==1'b1)
              begin
                ack_n<=1'b1;
                read_flag<=1'b0;
                current_state<=idle;
              end
            else
              begin
                current_state<=cannel_command;
              end
          end//end cannel_command;
        default:
          begin
            current_state<=idle;
          end//end default; 
      endcase
    end
///////////////end wr and rd///////
endmodule
