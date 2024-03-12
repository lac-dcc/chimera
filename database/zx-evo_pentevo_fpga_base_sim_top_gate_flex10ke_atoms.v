// Copyright (C) 1991-2006 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.


// Quartus II 6.1 Build 201 11/27/2006


///////////////////////////////////////////////////////////////////////////////
//
//              	FLEX10KE LCELL ATOM 
//  
//  Supports lut_mask, does not support equations. 
//  Support normal, arithmetic, updown counter and iclrable counter mode. 
//  parameter output_mode is informational only and has no simulation function. 
//  No checking is done for validation of parameters passed from top level. 
//  Input default values are implemented using tri1 and tri0 net. 
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps
module  flex10ke_asynch_lcell (dataa, datab, datac, datad,
                      cin, cascin, qfbkin,
                      combout, regin, cout, cascout) ;

    parameter operation_mode     = "normal" ;
    parameter output_mode        = "reg_and_comb";
    parameter lut_mask        	 = "ffff" ;
    parameter cin_used           = "false";

    input  dataa, datab, datac, datad ;
    input  cin, qfbkin;
    input  cascin;
    output cout, cascout, regin, combout ;

    reg icout, data, tmp_cascin;
    reg [15:0] bin_mask;
    reg [2:0] iop_mode;

	wire idataa;
	wire idatab;
	wire idatac;
	wire idatad;
	wire icascin;
	wire icin;    

	buf (idataa, dataa);
	buf (idatab, datab);
	buf (idatac, datac);
	buf (idatad, datad);
	buf (icascin, cascin);
	buf (icin, cin);    

    specify


    (dataa => combout) = (0, 0) ;
    (datab => combout) = (0, 0) ;
    (datac => combout) = (0, 0) ;
    (datad => combout) = (0, 0) ;
    (cascin => combout) = (0, 0) ;
    (cin => combout) = (0, 0) ;
    (qfbkin => combout) = (0, 0) ;

    (dataa => cout) = (0, 0);
    (datab => cout) = (0, 0);
    (datac => cout) = (0, 0);
    (datad => cout) = (0, 0);
    (cin => cout) = (0, 0) ;
    (qfbkin => cout) = (0, 0) ;

    (cascin => cascout) = (0, 0) ;
    (cin => cascout) = (0, 0) ;
    (dataa => cascout) = (0, 0) ;
    (datab => cascout) = (0, 0) ;
    (datac => cascout) = (0, 0) ;
    (datad => cascout) = (0, 0) ;
    (qfbkin => cascout) = (0, 0) ;

    (dataa => regin) = (0, 0) ;
    (datab => regin) = (0, 0) ;
    (datac => regin) = (0, 0) ;
    (datad => regin) = (0, 0) ;
    (cascin => regin) = (0, 0) ;
    (cin => regin) = (0, 0) ;
    (qfbkin => regin) = (0, 0) ;

    endspecify

    function [16:1] str_to_bin ;
      input  [8*4:1] s;
      reg [8*4:1] reg_s;
      reg [4:1]   digit [8:1];
      reg [8:1] tmp;
      integer   m , ivalue ;
      begin
 
         ivalue = 0;
         reg_s = s;
         for (m=1; m<=4; m= m+1 )
         begin
                tmp = reg_s[32:25];
                digit[m] = tmp & 8'b00001111;
                reg_s = reg_s << 8;
                if (tmp[7] == 'b1)
                   digit[m] = digit[m] + 9;
         end
         str_to_bin = {digit[1], digit[2], digit[3], digit[4]};
    end   
    endfunction
  
    function lut4 ;
	input [15:0] mask ;
        input dataa, datab, datac, datad ;
        reg prev_lut4;
        reg dataa_new, datab_new, datac_new, datad_new;
        integer h, i, j, k;
        integer hn, in, jn, kn;
        integer exitloop;
        integer check_prev;

        begin
	    lut4 = mask[{datad, datac, datab, dataa}];	// Try direct index first
	    if (lut4 === 1'bx)
	    begin
                if ((datad === 1'bx) || (datad === 1'bz))
                begin
                    datad_new = 1'b0;
                    hn = 2;
                end
                else
                begin
                    datad_new = datad;
                    hn = 1;
                end
                check_prev = 0;
                exitloop = 0;
                h = 1;
                while ((h <= hn) && (exitloop == 0))
                begin
                    if ((datac === 1'bx) || (datac === 1'bz))
                    begin
                        datac_new = 1'b0;
                        in = 2;
                    end
                    else
                    begin
                        datac_new = datac;
                        in = 1;
                    end
                    i = 1;
                    while ((i <= in) && (exitloop ==0))
                    begin
                        if ((datab === 1'bx) || (datab === 1'bz))
                        begin
                            datab_new = 1'b0;
                            jn = 2;
                        end
                        else
                        begin
                            datab_new = datab;
                            jn = 1;
                        end
                        j = 1;
                        while ((j <= jn) && (exitloop ==0))
                        begin
                            if ((dataa === 1'bx) || (dataa === 1'bz))
                            begin
                                dataa_new = 1'b0;
                                kn = 2;
                            end
                            else
                            begin
                                dataa_new = dataa;
                                kn = 1;
                            end
                            k = 1;
                            while ((k <= kn) && (exitloop ==0))
                            begin
                                lut4 = mask[{datad_new, datac_new, datab_new, dataa_new}];

                                if ((check_prev == 1) && (prev_lut4 !==lut4))
                                begin
                                    lut4 = 1'bx;
                                    exitloop = 1;
                                end
                                else
                                begin
                                    check_prev = 1;
                                    prev_lut4 = lut4;
                                end
                                k = k + 1;
                                dataa_new = 1'b1;
                            end // loop a
                            j = j + 1;
                            datab_new = 1'b1;
                        end // loop b
                        i = i + 1;
                        datac_new = 1'b1;
                    end // loop c
                    h = h + 1;
                    datad_new = 1'b1;
                end // loop d
            end
		
 	end
     endfunction

     initial
     begin
	tmp_cascin = 1;
	bin_mask = str_to_bin (lut_mask) ;

	if (operation_mode == "normal" && cin_used == "true") iop_mode = 4;	// normal+cin is chain end only
	else if (operation_mode == "normal") iop_mode = 0;	// most common
	else if (operation_mode == "arithmetic") iop_mode = 1;	// second most common
	else if (operation_mode == "up_dn_cntr") iop_mode = 2;
	else if (operation_mode == "clrb_cntr") iop_mode = 3;
	else
	begin
	    $display ("Error: Invalid operation_mode specified\n");
	    iop_mode = 5;
	end
     end	

     always @(idatad or idatac or idatab or idataa or icin or 
             icascin or qfbkin)
     begin
   	if (iop_mode == 0)	// operation_mode == "normal" without cin
	begin
	if ((icascin == 1'b1) || (icascin == 1'b0))
	   tmp_cascin = icascin;

           data = lut4(bin_mask, idataa, idatab, idatac, idatad) && tmp_cascin;
        end

	else if (iop_mode == 1)	// operation_mode == "arithmetic"
	begin
	if ((icascin == 1'b1) || (icascin == 1'b0))
		tmp_cascin = icascin;
		
		data = lut4 (bin_mask, idataa, idatab, icin, 'b1) && tmp_cascin ;
		icout = lut4 ( bin_mask, idataa, idatab, icin, 'b0) ;
        end

	else if (iop_mode == 2)	// operation_mode == "up_dn_cntr"
	begin
	if ((icascin == 1'b1) || (icascin == 1'b0))
		tmp_cascin = icascin;
		icout = lut4(bin_mask, qfbkin, idatab, icin, 'b0);
		if (idatad == 'b0)
			data = idatac && tmp_cascin;
		else
			data = (lut4(bin_mask, idataa, qfbkin, icin, 'b1)) && tmp_cascin;
	end

	else if (iop_mode == 3)	// operation_mode == "clrb_cntr"
	begin
		icout = lut4(bin_mask, qfbkin, idatab, icin, 'b0);
		if (idatad == 'b0)
			data = idatac && idatab;
		else
			data = (lut4(bin_mask, idataa, qfbkin, icin, 'b1)) && idatab;
	end
   	else if (iop_mode == 4)	// operation_mode == "normal" with cin
	begin
	if ((icascin == 1'b1) || (icascin == 1'b0))
	    tmp_cascin = icascin;

            data = lut4 (bin_mask, idataa, idatab, icin, idatad) && tmp_cascin;
        end
     end

     and (cascout, data, 'b1) ;
     and (combout, data, 'b1) ;
     and (cout, icout, 'b1) ;
     and (regin, data, 'b1) ;

endmodule

`timescale 1 ps/1 ps

module  flex10ke_lcell_register (clk, aclr, aload,
                      datain, dataa, datab, datac, datad, devclrn, devpor, regout, qfbko) ;

    parameter operation_mode = "normal";
    parameter packed_mode    	 = "false" ;
    parameter clock_enable_mode = "false";
    parameter x_on_violation = "on";

    input  clk, datain, dataa, datab, datac, datad;
    input  aclr, aload, devclrn, devpor ;
    output regout, qfbko ;

    reg iregout, init, oldclk;
    reg [1:0] isync_mode;
    reg iclock_enable_mode;
    wire clk_in, idataa, idatac, idatad;
    wire reset;

    reg datain_viol, dataa_viol, datab_viol, datac_viol, datad_viol;
    reg aload_viol;
    reg clk_per_viol;
    reg violation;

	wire iclr;
	wire iaload;
	wire idatab;

	buf (clk_in, clk);
	buf (iclr, aclr);
	buf (iaload, aload);
	buf (idataa, dataa);
	buf (idatab, datab);
	buf (idatac, datac);
	buf (idatad, datad);

	assign reset = devpor && devclrn && (!iclr) && idataa;

    specify

    $period (posedge clk &&& reset, 0, clk_per_viol);	

    $setuphold (posedge clk &&& reset, datain, 0, 0, datain_viol) ;
    $setuphold (posedge clk &&& reset, dataa, 0, 0, dataa_viol) ;
    $setuphold (posedge clk &&& reset, datab, 0, 0, datab_viol) ;
    $setuphold (posedge clk &&& reset, datac, 0, 0, datac_viol) ;
    $setuphold (posedge clk &&& reset, datad, 0, 0, datad_viol) ;
    $setuphold (posedge clk &&& reset, aload, 0, 0, aload_viol) ;


    (posedge clk => (regout +: iregout)) = 0 ;
    (posedge aclr => (regout +: 1'b0)) = (0, 0) ;

    (posedge clk => (qfbko +: iregout)) = 0 ;
    (posedge aclr => (qfbko +: 1'b0)) = (0, 0) ;

    endspecify

    initial
    begin
	violation = 1;	
	init = 0;
	oldclk = 'b0;
	
	if (operation_mode == "clrb_cntr")	 isync_mode = 0;
	else if (operation_mode == "up_dn_cntr") isync_mode = 1;
	else if (packed_mode == "true")		 isync_mode = 2;
	else if (packed_mode == "false")	 isync_mode = 3;
	else
	  $display("Error: Invalid combination of parameters used. Packed mode may be used only when operation_mode is 'normal'.\n");	

	iclock_enable_mode = (clock_enable_mode == "true");
    end

    always @ (datain_viol or dataa_viol or datab_viol or datac_viol or datad_viol or aload_viol or clk_per_viol)
    begin
        if (x_on_violation == "on")
            violation = 1;
    end

     always @ (clk_in or iclr or devclrn or devpor or posedge violation or idatac or iaload)
     begin
        if (violation == 1'b1)
        begin
           violation = 0;
           iregout = 'bx;
        end
        else
        begin
	   if (devclrn == 'b0)
		 iregout = 'b0;
	   else if (iclr == 'b1) 
		 iregout = 'b0 ;
	   else if (iaload == 'b1)
		 iregout = idatac;
	   else if ((clk_in == 'b1)&&(oldclk == 'b0)&&((iclock_enable_mode == 1'b0) || (idataa == 1'b1)))
	   begin
		case (isync_mode)
		0:	// operation_mode == "clrb_cntr"
		begin
			if (idatab == 'b0)
			begin
				iregout = 'b0;
			end
			else if (idatad == 'b0)
			begin
				iregout = idatac;
			end
			else
			begin
				iregout = datain;
			end
		end
		1:	// operation_mode == "up_dn_cntr"
		begin
			if (idatad == 'b0)
			begin
				iregout = idatac;
			end
			else
			begin
				iregout = datain;
			end
		end
	      	2:	iregout = idatad;	// packed_mode == "true"
	    	3:	iregout = datain;	// packed_mode == "false"
	    	endcase
	   end
        end
	if (init==0)
	begin
		iregout = 'b0;
		init = 1;
	end
	oldclk = clk_in;
     end

     and (regout, iregout, 'b1) ;
     and (qfbko, iregout, 'b1) ;

endmodule

`timescale 1 ps/1 ps

module  flex10ke_lcell (clk, dataa, datab, datac, datad, aclr,
                      aload, cin, cascin, devclrn, devpor,
                      combout, regout, cout, cascout) ;

parameter operation_mode     = "normal" ;
parameter output_mode        = "reg_and_comb";
parameter packed_mode        = "false" ;
parameter clock_enable_mode  = "false";
parameter lut_mask           = "ffff" ;
parameter cin_used           = "false";
parameter x_on_violation     = "on";

input  clk, dataa, datab, datac, datad ;
input  aclr, aload, cin, cascin, devclrn, devpor ;
output cout, cascout, regout, combout ;
wire dffin, qfbk;

flex10ke_asynch_lcell lecomb (dataa, datab, datac, datad, cin, cascin,
                              qfbk, combout, dffin, cout, cascout);

defparam lecomb.operation_mode = operation_mode,
         lecomb.output_mode = output_mode,
         lecomb.cin_used = cin_used,
         lecomb.lut_mask = lut_mask;

flex10ke_lcell_register lereg (clk, aclr, aload, dffin, dataa, datab, datac, datad,
                               devclrn, devpor, regout, qfbk);

defparam lereg.operation_mode = operation_mode,
	 lereg.packed_mode = packed_mode,
	 lereg.clock_enable_mode = clock_enable_mode,
         lereg.x_on_violation = x_on_violation;

endmodule

///////////////////////////////////////////////////////////////////////////////
//
// FLEX10KE IO Atom
//
`timescale 1 ps/1 ps
module  flex10ke_io (clk, datain, aclr, ena, oe, devclrn, devoe, devpor,
                   padio, dataout) ;

  parameter operation_mode  		= "input" ;
  parameter reg_source_mode          	= "none" ;
  parameter feedback_mode		= "from_pin" ;
  parameter power_up                    = "low";
  parameter open_drain_output           = "false";
 
  inout     padio ;
  input     datain, clk, aclr, ena, oe, devpor, devoe, devclrn ;
  output    dataout;
  wire reg_pre, reg_clr;
  tri1 ena;
  tri0 aclr;

  wire dffeD, dffeQ;

specify

endspecify

assign reg_clr = (power_up == "low") ? devpor : 1'b1;
assign reg_pre = (power_up == "high") ? devpor : 1'b1;

flex10ke_asynch_io inst1 (datain, oe, padio, dffeD, dffeQ, dataout);
   defparam
            inst1.operation_mode = operation_mode,
            inst1.reg_source_mode = reg_source_mode,
            inst1.feedback_mode = feedback_mode,
            inst1.open_drain_output = open_drain_output;

dffe_io io_reg (dffeQ, clk, ena, dffeD, devclrn && !aclr && reg_clr, reg_pre);

endmodule

//
// ASYNCH_IO
//
module flex10ke_asynch_io(datain, oe, padio, dffeD, dffeQ, dataout);

  parameter operation_mode  		= "input" ;
  parameter reg_source_mode          	= "none" ;
  parameter feedback_mode		= "from_pin" ;
  parameter open_drain_output           = "false";

input datain, oe;
input dffeQ;
output dffeD;
output dataout;
inout padio;

  reg tmp_comb, tri_in, tri_in_new, temp;
  reg reg_indata, tmp_dataout, switch;
  reg [3:0] isource_mode;
  reg op_mode_output;
  reg op_mode_bidir;
  reg ifeedback_from_pin;
  reg ifeedback_from_reg;
  wire regout;
 
   specify

     (padio => dataout) = (0, 0);
     (posedge oe => (padio +: tri_in_new)) = 0;
     (negedge oe => (padio +: 1'bz)) = 0;
     (datain => padio) = (0, 0);
     (dffeQ => padio) = (0, 0);
     (dffeQ => dataout) = (0, 0);

   endspecify

  wire ipadio;
  wire idatain;
  wire ioe;

  buf (ipadio, padio);
  buf (idatain, datain);
  buf (ioe, oe);

initial
begin
  tri_in = 1'b0;
  tmp_comb = 'b0;
  reg_indata = 'b0;

	if ((reg_source_mode == "none") && (feedback_mode == "none"))
	begin
		if ((operation_mode == "output") ||
		        (operation_mode == "bidir"))
		    isource_mode = 0;	// tri_in = idatain;
	end
	else if ((reg_source_mode == "none") && (feedback_mode == "from_pin"))
        begin
		if (operation_mode == "input")
			isource_mode = 1;	// tmp_comb = ipadio;
		else if (operation_mode == "bidir")
		begin
			isource_mode = 2;	// tmp_comb = ipadio;	tri_in = idatain;
		end
		else $display ("Error: Invalid operation_mode specified\n");
        end
	else if ((reg_source_mode == "data_in") && (feedback_mode == "from_reg"))
	begin
		if ((operation_mode == "output") || (operation_mode == "bidir"))
                begin
		     isource_mode = 3;	// tri_in = idatain;     reg_indata = idatain;
                end
		else $display ("Error: Invalid operation_mode specified\n");
	end
	else if ((reg_source_mode == "pin_only") &&
			(feedback_mode == "from_reg"))	
	begin
		if (operation_mode == "input")
			isource_mode = 4;	// reg_indata = ipadio;
		else if (operation_mode == "bidir")  
		begin
			isource_mode = 5;	// tri_in = idatain;	reg_indata = ipadio;
		end
		else $display ("Error: Invalid operation_mode specified\n"); 
	end
	else if ((reg_source_mode == "data_in_to_pin") && 
			(feedback_mode == "from_pin")) 
	begin
		if (operation_mode == "bidir")
		begin
			isource_mode = 6;	// tri_in = dffeQ; reg_indata = idatain; tmp_comb = ipadio;
		end
		else $display ("Error: Invalid operation_mode specified\n");
	end
	else if ((reg_source_mode == "data_in_to_pin") &&
			(feedback_mode == "from_reg"))     
	begin 
		if ((operation_mode == "output") ||
                       (operation_mode == "bidir"))
		begin
			isource_mode = 7;	// reg_indata = idatain; tri_in = dffeQ;
		end
		else $display ("Error: Invalid operation_mode specified\n");
	end 
	else if ((reg_source_mode == "data_in_to_pin") && 
			(feedback_mode == "none"))      
	begin  
		if ((operation_mode == "output") ||
                       (operation_mode == "bidir"))
		begin 
			isource_mode = 8;	// tri_in = dffeQ; reg_indata = idatain;
		end 
		else $display ("Error: Invalid operation_mode specified\n"); 
	end  
	else if ((reg_source_mode == "pin_loop") && 
			(feedback_mode == "from_pin"))
	begin
		if (operation_mode == "bidir")
		begin
			isource_mode = 9;	// tri_in = dffeQ; reg_indata = ipadio; tmp_comb = ipadio;
		end
		else $display ("Error: Invalid operation_mtmp_dataouttmp_dataoutode specified\n");
	end
	else if ((reg_source_mode == "pin_loop") &&  
			(feedback_mode == "from_reg"))
	begin
		if (operation_mode == "bidir")
		begin
			isource_mode = 10;	// reg_indata = ipadio; tri_in = dffeQ;
		end
		else $display ("Error: Invalid operation_mode specified\n");
	end
	else
	begin
		isource_mode = 11;
		$display ("Error: Invalid combination of paratmp_dataoutmeters used\n");
	end

	op_mode_output = (operation_mode == "output");
	op_mode_bidir = (operation_mode == "bidir");
	ifeedback_from_pin = (feedback_mode == "from_pin");
	ifeedback_from_reg = (feedback_mode == "from_reg");
end

always @(ipadio or idatain or ioe or dffeQ)
begin
	case (isource_mode)
	0:	tri_in = idatain;
	1:	tmp_comb = ipadio;
	2:	begin
			tmp_comb = ipadio;
			tri_in = idatain;
		end
	3:	begin
			tri_in = idatain;
			reg_indata = idatain;
                end
	4:	reg_indata = ipadio;
	5:	begin
			tri_in = idatain;
			reg_indata = ipadio;
		end
	6:	begin
			tri_in = dffeQ;
			reg_indata = idatain;
			tmp_comb = ipadio;
		end
	7:	begin
			reg_indata = idatain;
			tri_in = dffeQ;
		end
	8:	begin 
			tri_in = dffeQ;
			reg_indata = idatain;
		end 
	9:	begin
			tri_in = dffeQ;
			reg_indata = ipadio;
			tmp_comb = ipadio;
		end
	10:	begin
			reg_indata = ipadio;
			tri_in = dffeQ;
		end
	endcase

	if (op_mode_output)
	begin
		if (ioe == 'b0)
			temp = 'bz;
		else
			temp = tri_in;
		if (open_drain_output == "false")
			tri_in_new = temp;
		else if (open_drain_output == "true")
		begin
			if ((reg_source_mode == "data_in_to_pin") && (feedback_mode != "from_pin"))
			begin
				if (temp == 'b0)
					tri_in_new = 'b0;
				else
					tri_in_new = 'bz;
			end
			else
			begin
				if (idatain == 'b1)
					tri_in_new = 'bz;
				else
					tri_in_new = 'b0;
			end
		end
	end
	else if (op_mode_bidir && (ioe == 'b1))
	begin
		if (open_drain_output == "false")
			tri_in_new = tri_in;
		else if (open_drain_output == "true")
		begin
			if (tri_in == 'b0)
				tri_in_new = 'b0;
			else
				tri_in_new = 'bz;
		end
	end
	else
		tri_in_new = 'bz;
	
	if (ifeedback_from_pin)
	begin
		tmp_dataout = tmp_comb;
		switch = 'b0;
	end
	else if (ifeedback_from_reg)
	begin
		tmp_dataout = 'b0;
		if (reg_indata == 'bx)
			switch = 'b0;
		else
			switch = 'b1;
	end
end

and (dffeD, reg_indata, 1'b1);
and (regout, dffeQ, switch, 1'b1);
or  (dataout, regout, tmp_dataout, 1'b0);
pmos (padio, tri_in_new, 'b0);

endmodule

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : FLEX10KE_ASYNCH_MEM
//
// Description : Timing simulation model for the asynchronous RAM array
//
//////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps
module flex10ke_asynch_mem (datain,
                            we,
                            re,
                            raddr,
                            waddr,
                            modesel,
                            dataout);

    // INPUT PORTS
    input datain;
    input we;
    input re;
    input [10:0] raddr;
    input [10:0] waddr;
    input [15:0] modesel;

    // OUTPUT PORTS
    output dataout;

    // GLOBAL PARAMETERS
    parameter logical_ram_depth     = 2048;
    parameter infile                = "none";
    parameter address_width         = 11;
    parameter first_address         = 0;
    parameter last_address          = 2047;
    parameter mem1                  = 512'b0;
    parameter mem2                  = 512'b0;
    parameter mem3                  = 512'b0;
    parameter mem4                  = 512'b0;
    parameter bit_number            = 0;
    parameter write_logic_clock     = "none";
    parameter read_enable_clock     = "none";
    parameter data_out_clock        = "none";
    parameter operation_mode        = "single_port";

    // INTERNAL VARIABLES AND NETS
    reg tmp_dataout;
    reg [10:0] rword;
    reg [10:0] wword;
    reg [2047:0] mem;
    reg write_en;
    reg read_en;
    reg write_en_last_value;
    wire [10:0] waddr_in;
    wire [10:0] raddr_in;
    integer i;

    wire we_in;
    wire re_in;
    wire datain_in;

    // BUFFER INPUTS
    buf (we_in, we);
    buf (re_in, re);
    buf (datain_in, datain);

    buf (waddr_in[0], waddr[0]);
    buf (waddr_in[1], waddr[1]);
    buf (waddr_in[2], waddr[2]);
    buf (waddr_in[3], waddr[3]);
    buf (waddr_in[4], waddr[4]);
    buf (waddr_in[5], waddr[5]);
    buf (waddr_in[6], waddr[6]);
    buf (waddr_in[7], waddr[7]);
    buf (waddr_in[8], waddr[8]);
    buf (waddr_in[9], waddr[9]);
    buf (waddr_in[10], waddr[10]);

    buf (raddr_in[0], raddr[0]);
    buf (raddr_in[1], raddr[1]);
    buf (raddr_in[2], raddr[2]);
    buf (raddr_in[3], raddr[3]);
    buf (raddr_in[4], raddr[4]);
    buf (raddr_in[5], raddr[5]);
    buf (raddr_in[6], raddr[6]);
    buf (raddr_in[7], raddr[7]);
    buf (raddr_in[8], raddr[8]);
    buf (raddr_in[9], raddr[9]);
    buf (raddr_in[10], raddr[10]);

    // TIMING PATHS
    specify
     
        $setup (waddr[0], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[1], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[2], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[3], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[4], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[5], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[6], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[7], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[8], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[9], posedge we &&& (~modesel[2]), 0);
        $setup (waddr[10], posedge we &&& (~modesel[2]), 0);

        $setuphold (negedge re &&& (~modesel[4]), raddr[0], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[1], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[2], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[3], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[4], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[5], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[6], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[7], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[8], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[9], 0, 0);
        $setuphold (negedge re &&& (~modesel[4]), raddr[10], 0, 0);

        $setuphold (negedge we &&& (~modesel[0]), datain, 0, 0);

        $hold (negedge we &&& (~modesel[2]), waddr[0], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[1], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[2], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[3], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[4], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[5], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[6], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[7], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[8], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[9], 0);
        $hold (negedge we &&& (~modesel[2]), waddr[10], 0);

        $nochange (posedge we &&& (~modesel[2]), waddr, 0, 0);

        $width (posedge we, 0);
        $width (posedge re, 0);

        (raddr[0] => dataout) = (0, 0);
        (raddr[1] => dataout) = (0, 0);
        (raddr[2] => dataout) = (0, 0);
        (raddr[3] => dataout) = (0, 0);
        (raddr[4] => dataout) = (0, 0);
        (raddr[5] => dataout) = (0, 0);
        (raddr[6] => dataout) = (0, 0);
        (raddr[7] => dataout) = (0, 0);
        (raddr[8] => dataout) = (0, 0);
        (raddr[9] => dataout) = (0, 0);
        (raddr[10] => dataout) = (0, 0);
        (waddr[0] => dataout) = (0, 0);
        (waddr[1] => dataout) = (0, 0);
        (waddr[2] => dataout) = (0, 0);
        (waddr[3] => dataout) = (0, 0);
        (waddr[4] => dataout) = (0, 0);
        (waddr[5] => dataout) = (0, 0);
        (waddr[6] => dataout) = (0, 0);
        (waddr[7] => dataout) = (0, 0);
        (waddr[8] => dataout) = (0, 0);
        (waddr[9] => dataout) = (0, 0);
        (waddr[10] => dataout) = (0, 0);
        (re => dataout) = (0, 0);
        (we => dataout) = (0, 0);
        (datain => dataout) = (0, 0);

    endspecify

    initial
    begin
        mem = {mem4, mem3, mem2, mem1};

        // if WE is not registered, initial RAM content is X
        // note that if WE is not registered, the MIF file cannot be used
        if ((operation_mode != "rom") && (write_logic_clock == "none"))
        begin
            for (i = 0; i <= 2047; i=i+1)
               mem[i] = 'bx;
        end

        tmp_dataout = 'b0;
        if ((operation_mode == "rom") || (operation_mode == "single_port"))
        begin
           // re is always active
           tmp_dataout = mem[0];
        end
        else begin
           // re is inactive
           tmp_dataout = 'b0;
        end
        if (read_enable_clock != "none")
        begin
           if ((operation_mode == "rom") || (operation_mode == "single_port"))
           begin
              // re is always active
              tmp_dataout = mem[0];
           end
           else begin
              // eab cell output powers up to VCC
              tmp_dataout = 'b1;
           end
        end
    end

    always @(we_in or re_in or raddr_in or waddr_in or datain_in)
    begin
        rword = raddr_in[10:0];
        wword = waddr_in[10:0];

        read_en = re_in;
        write_en = we_in;
 
        if (modesel[14:13] == 2'b10)
        begin
            if (read_en == 1)
               tmp_dataout = mem[rword];
        end
        else if (modesel[14:13] == 2'b00)
        begin
            if ((write_en == 0) && (write_en_last_value == 1))
                mem[wword] = datain_in;
            if (write_en == 0)
                tmp_dataout = mem[wword];
            else if (write_en == 1)
                tmp_dataout = datain_in;
            else tmp_dataout = 'bx;
        end
        else if (modesel[14:13] == 2'b01)
        begin
            if ((write_en == 0) && (write_en_last_value == 1))
                mem[wword] = datain_in;
            if ((read_en == 1) && (rword == wword) && (write_en == 1))
                tmp_dataout = datain_in;
            else if (read_en == 1)
                tmp_dataout = mem[rword];
        end
        write_en_last_value = write_en;
    end

    and (dataout, tmp_dataout, 'b1);

endmodule // flex10ke_asynch_mem

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : PRIM_DFFE
//
// Description : State table for UDP PRIM_DFFE
//
//////////////////////////////////////////////////////////////////////////////

primitive PRIM_DFFE (Q, ENA, D, CLK, CLRN, PRN, notifier);
    input D;   
    input CLRN;
    input PRN;
    input CLK;
    input ENA;
    input notifier;
    output Q; reg Q;

    initial Q = 1'b0;

    table

    //  ENA  D   CLK   CLRN  PRN  notifier  :   Qt  :   Qt+1

        (??) ?    ?      1    1      ?      :   ?   :   -;  // pessimism
         x   ?    ?      1    1      ?      :   ?   :   -;  // pessimism
         1   1   (01)    1    1      ?      :   ?   :   1;  // clocked data
         1   1   (01)    1    x      ?      :   ?   :   1;  // pessimism
 
         1   1    ?      1    x      ?      :   1   :   1;  // pessimism
 
         1   0    0      1    x      ?      :   1   :   1;  // pessimism
         1   0    x      1  (?x)     ?      :   1   :   1;  // pessimism
         1   0    1      1  (?x)     ?      :   1   :   1;  // pessimism
 
         1   x    0      1    x      ?      :   1   :   1;  // pessimism
         1   x    x      1  (?x)     ?      :   1   :   1;  // pessimism
         1   x    1      1  (?x)     ?      :   1   :   1;  // pessimism
 
         1   0   (01)    1    1      ?      :   ?   :   0;  // clocked data

         1   0   (01)    x    1      ?      :   ?   :   0;  // pessimism

         1   0    ?      x    1      ?      :   0   :   0;  // pessimism
         0   ?    ?      x    1      ?      :   ?   :   -;

         1   1    0      x    1      ?      :   0   :   0;  // pessimism
         1   1    x    (?x)   1      ?      :   0   :   0;  // pessimism
         1   1    1    (?x)   1      ?      :   0   :   0;  // pessimism

         1   x    0      x    1      ?      :   0   :   0;  // pessimism
         1   x    x    (?x)   1      ?      :   0   :   0;  // pessimism
         1   x    1    (?x)   1      ?      :   0   :   0;  // pessimism

         1   1   (x1)    1    1      ?      :   1   :   1;  // reducing pessimism
         1   0   (x1)    1    1      ?      :   0   :   0;
         1   1   (0x)    1    1      ?      :   1   :   1;
         1   0   (0x)    1    1      ?      :   0   :   0;

         ?   ?   ?       0    1      ?      :   ?   :   0;  // asynch clear

         ?   ?   ?       1    0      ?      :   ?   :   1;  // asynch set

         1   ?   (?0)    1    1      ?      :   ?   :   -;  // ignore falling clock
         1   ?   (1x)    1    1      ?      :   ?   :   -;  // ignore falling clock
         1   *    ?      ?    ?      ?      :   ?   :   -; // ignore data edges

         1   ?   ?     (?1)   ?      ?      :   ?   :   -;  // ignore edges on
         1   ?   ?       ?  (?1)     ?      :   ?   :   -;  //  set and clear

         0   ?   ?       1    1      ?      :   ?   :   -;  //  set and clear

        ?   ?   ?       1    1      *      :   ?   :   x; // spr 36954 - at any
                                                    // notifier event,
                                                    // output 'x'
    endtable

endprimitive // PRIM_DFFE

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : FLEX10KE_DFFE
//
// Description : Timing simulation model for a DFFE register
//
//////////////////////////////////////////////////////////////////////////////

module flex10ke_dffe ( Q,
             CLK,
             ENA,
             D,
             CLRN,
             PRN );

    // INPUT PORTS
    input D;
    input CLK;
    input CLRN;
    input PRN;
    input ENA;

    // OUTPUT PORTS
    output Q;

    // INTERNAL VARIABLES AND NETS
    wire legal;
    reg viol_notifier;

    // INSTANTIATE THE UDP
    PRIM_DFFE ( Q, ENA, D, CLK, CLRN, PRN, viol_notifier );

    // filter out illegal values like 'X'
    and(legal, ENA, CLRN, PRN);

    specify

        specparam TREG = 0;
        specparam TREN = 0;
        specparam TRSU = 0;
        specparam TRH  = 0;
        specparam TRPR = 0;
        specparam TRCL = 0;
 
        $setup  (  D, posedge CLK &&& legal, TRSU, viol_notifier  ) ;
        $hold   (  posedge CLK &&& legal, D, TRH, viol_notifier   ) ;
        $setup  (  ENA, posedge CLK &&& legal, TREN, viol_notifier  ) ;
        $hold   (  posedge CLK &&& legal, ENA, 0, viol_notifier   ) ;
 
        ( negedge CLRN => (Q  +: 1'b0)) = ( TRCL, TRCL) ;
        ( negedge PRN  => (Q  +: 1'b1)) = ( TRPR, TRPR) ;
        ( posedge CLK  => (Q  +: D)) = ( TREG, TREG) ;
 
    endspecify

endmodule // flex10ke_dffe

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : DFFE_IO
//
// Description : Timing simulation model for a DFFE register for IO atom
//
//////////////////////////////////////////////////////////////////////////////

module dffe_io ( Q, CLK, ENA, D, CLRN, PRN );
    input D;
    input CLK;
    input CLRN;
    input PRN;
    input ENA;
    output Q;

    wire D_ipd;
    wire ENA_ipd;
    wire CLK_ipd;
    wire PRN_ipd;
    wire CLRN_ipd;

    buf (D_ipd, D);
    buf (ENA_ipd, ENA);
    buf (CLK_ipd, CLK);
    buf (PRN_ipd, PRN);
    buf (CLRN_ipd, CLRN);

    wire legal;
    reg viol_notifier;

    PRIM_DFFE ( Q, ENA_ipd, D_ipd, CLK_ipd, CLRN_ipd, PRN_ipd, viol_notifier);

    and(legal, ENA_ipd, CLRN_ipd, PRN_ipd);

    specify

      specparam TREG = 0;
      specparam TREN = 0;
      specparam TRSU = 0;
      specparam TRH  = 0;
      specparam TRPR = 0;
      specparam TRCL = 0;
 
        $setup  (  D, posedge CLK &&& legal, TRSU, viol_notifier  ) ;
        $hold   (  posedge CLK &&& legal, D, TRH, viol_notifier   ) ;
        $setup  (  ENA, posedge CLK &&& legal, TREN, viol_notifier  ) ;
        $hold   (  posedge CLK &&& legal, ENA, 0, viol_notifier   ) ;
 
        ( negedge CLRN => (Q  +: 1'b0)) = ( TRCL, TRCL) ;
        ( negedge PRN  => (Q  +: 1'b1)) = ( TRPR, TRPR) ;
        ( posedge CLK  => (Q  +: D)) = ( TREG, TREG) ;
 
    endspecify
endmodule // dffe_io

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : mux21
//
// Description : Simulation model for a 2 to 1 mux used in the RAM_SLICE
//               This is a purely functional module, without any timing.
//
//////////////////////////////////////////////////////////////////////////////

module mux21 (MO,
              A,
              B,
              S);
    input A, B, S;
    output MO;

    assign MO = (S == 1) ? B : A;

endmodule // mux21

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : and1
//
// Description : Simulation model for a 1-input AND gate
//
//////////////////////////////////////////////////////////////////////////////

module and1 (Y,
             IN1);
    input IN1;
    output Y;

    specify
        (IN1 => Y) = (0, 0);
    endspecify

    buf (Y, IN1);
endmodule // and1

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : and11
//
// Description : Simulation model for a 11-input AND gate
//
//////////////////////////////////////////////////////////////////////////////

module and11 (Y, IN1);
input [10:0] IN1;
output [10:0] Y;

    specify
    (IN1 => Y) = (0, 0);
    endspecify

buf (Y[0], IN1[0]);
buf (Y[1], IN1[1]);
buf (Y[2], IN1[2]);
buf (Y[3], IN1[3]);
buf (Y[4], IN1[4]);
buf (Y[5], IN1[5]);
buf (Y[6], IN1[6]);
buf (Y[7], IN1[7]);
buf (Y[8], IN1[8]);
buf (Y[9], IN1[9]);
buf (Y[10], IN1[10]);

endmodule // and11

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : nmux21
//
// Description : Simulation model for a 2 to 1 mux used in the RAM_SLICE
//               The output is an inversion of the selected input.
//               This is a purely functional module, without any timing.
//
//////////////////////////////////////////////////////////////////////////////

module nmux21 (MO,
               A,
               B,
               S);
    input A, B, S; 
    output MO; 
 
    assign MO = (S == 1) ? ~B : ~A; 
 
endmodule // nmux21

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : bmux21
//
// Description : Simulation model for a 2 to 1 mux used in the RAM_SLICE
//               Each input is a 16-bit bus.
//               This is a purely functional module, without any timing.
//
//////////////////////////////////////////////////////////////////////////////

module bmux21 (MO,
               A,
               B,
               S);

    input [10:0] A, B;
    input S;
    output [10:0] MO; 
 
    assign MO = (S == 1) ? B : A; 
 
endmodule // bmux21

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : b5mux21
//
// Description : Simulation model for a 2 to 1 mux used in the CAM_SLICE.
//               Each input is a 5-bit bus.
//               This is a purely functional module, without any timing.
//
//////////////////////////////////////////////////////////////////////////////

module b5mux21 (MO,
                A,
                B,
                S);
    input [4:0] A, B;
    input S;
    output [4:0] MO; 
 
    assign MO = (S == 1) ? B : A; 
 
endmodule // b5mux21

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : FLEX10KE_RAM_SLICE
//
// Description : Timing simulation model for a single RAM segment of the
//               FLEX10KE family.
//               This model is a top-level structural description of the
//               RAM segment. It instantiates the peripheral registers,
//               mode-control multiplexers and the asynchronous memory
//               array.
//
//////////////////////////////////////////////////////////////////////////////

module flex10ke_ram_slice (datain,
                           clr0, 
                           clk0, 
                           clk1, 
                           ena0, 
                           ena1, 
                           we,
                           re,
                           waddr,
                           raddr,
                           devclrn,
                           devpor,
                           modesel,
                           dataout
                          );

    // INPUT PORTS
    input  datain;
    input  clk0;
    input  clk1;
    input  clr0;
    input  ena0;
    input  ena1;
    input  we;
    input  re;
    input  devclrn;
    input  devpor;
    input  [10:0] raddr;
    input  [10:0] waddr;
    input  [15:0] modesel;

    // OUTPUT PORTS
    output dataout;

    // GLOBAL PARAMETERS
    parameter operation_mode           = "single_port";
    parameter logical_ram_name         = "ram_xxx";
    parameter logical_ram_depth        = "2k";
    parameter logical_ram_width        = "1";
    parameter address_width            = 11;
    parameter data_in_clock            = "none";
    parameter data_in_clear            = "none";
    parameter write_logic_clock        = "none";
    parameter write_address_clear      = "none";
    parameter write_enable_clear       = "none";
    parameter read_enable_clock        = "none";
    parameter read_enable_clear        = "none";
    parameter read_address_clock       = "none";
    parameter read_address_clear       = "none";
    parameter data_out_clock           = "none";
    parameter data_out_clear           = "none";
    parameter init_file                = "none";
    parameter first_address            = 0;
    parameter last_address             = 2047;
    parameter bit_number               = "1";
    parameter mem1                     = 512'b0;
    parameter mem2                     = 512'b0;
    parameter mem3                     = 512'b0;
    parameter mem4                     = 512'b0;

    // INTERNAL NETS AND VARIABLES
    wire  datain_reg, we_reg, re_reg, dataout_reg;
    wire  we_reg_mux, we_reg_mux_delayed;
    wire  [10:0] raddr_reg, waddr_reg;
    wire  datain_int, we_int, re_int, dataout_int, dataout_tmp;
    wire  [10:0] raddr_int, waddr_int;
    wire  reen, raddren, dataouten;
    wire  datain_clr;
    wire  re_clk, raddr_clk;
    wire  datain_reg_sel, write_reg_sel, raddr_reg_sel;
    wire  re_reg_sel, dataout_reg_sel, re_clk_sel, re_en_sel;
    wire  raddr_clk_sel, raddr_en_sel;
    wire  dataout_en_sel;
    wire  datain_reg_clr, waddr_reg_clr, raddr_reg_clr;
    wire  re_reg_clr, dataout_reg_clr, we_reg_clr;
    wire  datain_reg_clr_sel;
    wire  waddr_reg_clr_sel;
    wire  we_reg_clr_sel;
    wire  raddr_reg_clr_sel;
    wire  re_reg_clr_sel, dataout_reg_clr_sel, NC;
    wire  we_pulse;

    wire clk0_delayed;

    reg we_int_delayed, datain_int_delayed;
    reg [10:0] waddr_int_delayed;

    // PULL UPs
    tri1 iena0;
    tri1 iena1;

    // READ MODESEL PORT BITS
    assign datain_reg_sel          = modesel[0];
    assign datain_reg_clr_sel      = modesel[1];
    assign write_reg_sel           = modesel[2];
    assign waddr_reg_clr_sel       = modesel[15];
    assign we_reg_clr_sel          = modesel[3];
    assign raddr_reg_sel           = modesel[4];
    assign raddr_reg_clr_sel       = modesel[5];
    assign re_reg_sel              = modesel[6];
    assign re_reg_clr_sel          = modesel[7];
    assign dataout_reg_sel         = modesel[8];
    assign dataout_reg_clr_sel     = modesel[9];
    assign re_clk_sel              = modesel[10];
    assign re_en_sel               = modesel[10];
    assign raddr_clk_sel           = modesel[11];
    assign raddr_en_sel            = modesel[11];
    assign dataout_en_sel          = modesel[12];

    assign iena0 = ena0;
    assign iena1 = ena1;
    assign NC = 0;


    always @ (datain_int or waddr_int or we_int)
    begin
       we_int_delayed = we_int;
       waddr_int_delayed <= waddr_int;
       datain_int_delayed <= datain_int;
    end

    mux21     datainsel       (datain_int,
                               datain,
                               datain_reg,
                               datain_reg_sel
                              );
    nmux21    datainregclr    (datain_reg_clr,
                               NC,
                               clr0,
                               datain_reg_clr_sel
                              );
    bmux21    waddrsel        (waddr_int,
                               waddr,
                               waddr_reg,
                               write_reg_sel
                              );
    nmux21    waddrregclr     (waddr_reg_clr,
                               NC,
                               clr0,
                               waddr_reg_clr_sel
                              );
    nmux21    weregclr        (we_reg_clr,
                               NC,
                               clr0,
                               we_reg_clr_sel
                              );
    mux21     wesel2          (we_int,
                               we_reg_mux_delayed,
                               we_pulse,
                               write_reg_sel
                              );
    mux21     wesel1          (we_reg_mux,
                               we,
                               we_reg,
                               write_reg_sel
                              );
    bmux21    raddrsel        (raddr_int,
                               raddr,
                               raddr_reg,
                               raddr_reg_sel
                              );
    nmux21    raddrregclr     (raddr_reg_clr,
                               NC,
                               clr0,
                               raddr_reg_clr_sel
                              );
    mux21     resel           (re_int,
                               re,
                               re_reg,
                               re_reg_sel
                              );
    mux21     dataoutsel      (dataout_tmp,
                               dataout_int,
                               dataout_reg,
                               dataout_reg_sel
                              );
    nmux21    dataoutregclr   (dataout_reg_clr,
                               NC,
                               clr0,
                               dataout_reg_clr_sel
                              );
    mux21     raddrclksel     (raddr_clk,
                               clk0,
                               clk1,
                               raddr_clk_sel
                              );
    mux21     raddrensel      (raddren,
                               iena0,
                               iena1,
                               raddr_en_sel
                              );
    mux21     reclksel        (re_clk,
                               clk0,
                               clk1,
                               re_clk_sel
                              );
    mux21     reensel         (reen,
                               iena0,
                               iena1,
                               re_en_sel
                              );
    nmux21    reregclr        (re_reg_clr,
                               NC,
                               clr0,
                               re_reg_clr_sel
                              );
    mux21     dataoutensel    (dataouten,
                               NC,
                               iena1,
                               dataout_en_sel
                              );
    flex10ke_dffe      dinreg          (datain_reg,
                               clk0,
                               iena0,
                               datain,
                               datain_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      wereg           (we_reg,
                               clk0,
                               iena0,
                               we,
                               we_reg_clr && devclrn && devpor,
                               1'b1
                              );
    
    // clk0 for we_pulse should have same delay as clk of wereg
    and1      clk0weregdelaybuf (clk0_delayed,
                                 clk0
                                );
    assign    we_pulse = we_reg_mux_delayed && (~clk0_delayed);
    
    and1      wedelaybuf      (we_reg_mux_delayed,
                               we_reg_mux
                              );    
    flex10ke_dffe      rereg           (re_reg,
                               re_clk,
                               reen,
                               re,
                               re_reg_clr && devclrn && devpor,
                               1'b1
                              );    
    flex10ke_dffe      dataoutreg      (dataout_reg,
                               clk1,
                               dataouten,
                               dataout_int, 
                               dataout_reg_clr && devclrn && devpor,
                               1'b1
                              );
    
    flex10ke_dffe      waddrreg_0      (waddr_reg[0],
                               clk0,
                               iena0,
                               waddr[0],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_1      (waddr_reg[1],
                               clk0,
                               iena0,
                               waddr[1],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_2      (waddr_reg[2],
                               clk0,
                               iena0,
                               waddr[2],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_3      (waddr_reg[3],
                               clk0,
                               iena0,
                               waddr[3],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_4      (waddr_reg[4],
                               clk0,
                               iena0,
                               waddr[4],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_5      (waddr_reg[5],
                               clk0,
                               iena0,
                               waddr[5],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_6      (waddr_reg[6],
                               clk0,
                               iena0,
                               waddr[6],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_7      (waddr_reg[7],
                               clk0,
                               iena0,
                               waddr[7],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_8      (waddr_reg[8],
                               clk0,
                               iena0,
                               waddr[8],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    flex10ke_dffe      waddrreg_9      (waddr_reg[9], 
                               clk0, 
                               iena0, 
                               waddr[9], 
                               waddr_reg_clr && devclrn && devpor, 
                               1'b1
                              );
    flex10ke_dffe      waddrreg_10     (waddr_reg[10],
                               clk0,
                               iena0,
                               waddr[10],
                               waddr_reg_clr && devclrn && devpor,
                               1'b1
                              );
    
    flex10ke_dffe     raddrreg_0      (raddr_reg[0],
                              raddr_clk,
                              raddren,
                              raddr[0],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_1      (raddr_reg[1],
                              raddr_clk,
                              raddren,
                              raddr[1],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_2      (raddr_reg[2],
                              raddr_clk,
                              raddren,
                              raddr[2],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_3      (raddr_reg[3],
                              raddr_clk,
                              raddren,
                              raddr[3],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_4      (raddr_reg[4],
                              raddr_clk,
                              raddren,
                              raddr[4],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_5      (raddr_reg[5],
                              raddr_clk,
                              raddren,
                              raddr[5],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_6      (raddr_reg[6],
                              raddr_clk,
                              raddren,
                              raddr[6],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_7      (raddr_reg[7],
                              raddr_clk,
                              raddren,
                              raddr[7],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_8      (raddr_reg[8],
                              raddr_clk,
                              raddren,
                              raddr[8],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_9      (raddr_reg[9],
                              raddr_clk,
                              raddren,
                              raddr[9],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
    flex10ke_dffe     raddrreg_10     (raddr_reg[10],
                              raddr_clk,
                              raddren,
                              raddr[10],
                              raddr_reg_clr && devclrn && devpor,
                              1'b1
                             );
       
    flex10ke_asynch_mem flexmem (datain_int_delayed,
                                 we_int_delayed,
                                 re_int,
                                 raddr_int,
                                 waddr_int_delayed,
                                 modesel,
                                 dataout_int
                                );
    
    defparam
        flexmem.address_width       = address_width,
        flexmem.bit_number          = bit_number,
        flexmem.logical_ram_depth   = logical_ram_depth,
        flexmem.first_address       = first_address,
        flexmem.last_address        = last_address,
        flexmem.write_logic_clock   = write_logic_clock,
        flexmem.read_enable_clock   = read_enable_clock,
        flexmem.data_out_clock      = data_out_clock,
        flexmem.infile              = init_file,
        flexmem.operation_mode      = operation_mode,
        flexmem.mem1                = mem1,
        flexmem.mem2                = mem2,
        flexmem.mem3                = mem3,
        flexmem.mem4                = mem4;
     
    assign dataout = dataout_tmp;

endmodule // flex10ke_ram_slice

/////////////////////////////////////////////////////////////////////////////
//
// Module Name : FLEX10KE_PLL
//
// Description : Simulation model for the FLEX10KE device family PLL.
//
/////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps
module flex10ke_pll (clk,
                     clk0,
                     clk1,
                     locked
                    );

    // INPUT PORTS
    input clk;

    // OUTPUT PORTS
    output clk0;
    output clk1;
    output locked;

    // GLOBAL PARAMETERS
    parameter clk0_multiply_by = 1;
    parameter clk1_multiply_by = 1;
    parameter input_frequency = 1000;

    // INTERNAL VARIABLES AND NETS
    reg start_inclk;
    reg new_inclk0;
    reg new_inclk1;
    reg pll_lock;
    reg clkout0_tmp;
    reg clkout1_tmp;
    reg locked_tmp;

    real pll_last_rising_edge;
    real pll_last_falling_edge;
    real actual_clk_cycle;
    real expected_clk_cycle;
    real pll_duty_cycle;
    real pll1_half_period;
    real pll2_half_period;

    integer pll_rising_edge_count;
    integer clk0_count;
    integer clk1_count;
    integer i;
    integer j;

    specify

    endspecify

    initial
    begin
        clk0_count = -1;
        clk1_count = -1;
        pll_rising_edge_count = 0;
        pll_lock = 1;
        clkout0_tmp = 1'b0;
        clkout1_tmp = 1'b0;
        locked_tmp = 1'b0;

        // resolve the parameters

        if (clk0_multiply_by > clk1_multiply_by)
            $display("");
    end

    always @(posedge clk)
    begin
        if (pll_rising_edge_count == 0)   // this is first rising edge
            start_inclk = clk;
        else if (pll_rising_edge_count == 1) // this is second rising edge
        begin
            expected_clk_cycle = input_frequency / 1000.0; // convert to ns
            actual_clk_cycle = $realtime - pll_last_rising_edge;
            if (actual_clk_cycle < (expected_clk_cycle - 1.0) ||
                actual_clk_cycle > (expected_clk_cycle + 1.0))
            begin
                $display($realtime, "Warning: Input frequency Violation");
                pll_lock = 0;
                locked_tmp = 0;
            end
            if ( ($realtime - pll_last_falling_edge) < (pll_duty_cycle - 0.1) ||                 ($realtime - pll_last_falling_edge) > (pll_duty_cycle + 0.1) )
            begin
                $display($realtime, "Warning: Duty Cycle Violation");
                pll_lock = 0;
                locked_tmp = 0;
            end
        end
        else if ( ($realtime - pll_last_rising_edge) < (actual_clk_cycle - 0.1) ||
                ($realtime - pll_last_rising_edge) > (actual_clk_cycle + 0.1) )
        begin
            $display($realtime, "Warning : Cycle Violation");
            pll_lock = 0;
            locked_tmp = 0;
        end
        pll_rising_edge_count = pll_rising_edge_count + 1;
        pll_last_rising_edge = $realtime;
    end

    always @(negedge clk)
    begin
        if (pll_rising_edge_count == 1)
        begin
            pll1_half_period = ($realtime - pll_last_rising_edge)/clk0_multiply_by;
            pll2_half_period = ($realtime - pll_last_rising_edge)/clk1_multiply_by;
            pll_duty_cycle = $realtime - pll_last_rising_edge;
        end
        else if ( ($realtime - pll_last_rising_edge) < (pll_duty_cycle - 0.1) ||
                  ($realtime - pll_last_rising_edge) > (pll_duty_cycle + 0.1) )
        begin
            $display($realtime, "Warning: Duty Cycle Violation");
            pll_lock = 0;
            locked_tmp = 0;
        end
        pll_last_falling_edge = $realtime;
    end

    always @(pll_rising_edge_count)
    begin
        if (pll_rising_edge_count > 2)
        begin
            for (i=1; i<= 2*clk0_multiply_by - 1; i=i+1)
            begin
                clk0_count = clk0_count + 1;
                #pll1_half_period;
            end
            clk0_count = clk0_count + 1;
        end
        else
            clk0_count = 0;
    end

    always @(pll_rising_edge_count)
    begin
        if (pll_rising_edge_count > 2)  // pll locks after 2 cycles
        begin
            for (j=1; j<= 2*clk1_multiply_by - 1; j=j+1)
            begin
                clk1_count = clk1_count + 1;
                #pll2_half_period;
            end
            clk1_count = clk1_count + 1;
        end
        else
            clk1_count = 0;
    end

    always @(clk0_count)
    begin
        if (clk0_count <= 0)
            clkout0_tmp = 1'b0;
        else if (pll_lock == 0)
            clkout0_tmp = 1'b0;
        else if (clk0_count == 1)
        begin
            locked_tmp = 1'b1;
            clkout0_tmp = start_inclk;
            new_inclk0 = ~start_inclk;
        end
        else
        begin
            clkout0_tmp = new_inclk0;
            new_inclk0 = ~new_inclk0;
        end
    end

    always @(clk1_count)
    begin
        if (clk1_count <= 0)
            clkout1_tmp = 1'b0;
        else if (pll_lock == 0)
            clkout1_tmp = 1'b0;
        else if (clk1_count == 1)
        begin
            locked_tmp = 1'b1;
            clkout1_tmp = start_inclk;
            new_inclk1 = ~start_inclk;
        end
        else
        begin
            clkout1_tmp = new_inclk1;
            new_inclk1 = ~new_inclk1;
        end
    end

    // ACCELERATE OUTPUTS
    assign clk0 = clkout0_tmp;
    assign clk1 = clkout1_tmp;
    assign locked = locked_tmp;

endmodule














