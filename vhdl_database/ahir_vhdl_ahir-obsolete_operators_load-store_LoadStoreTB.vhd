library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.LoadStorePack.all;
use ahir.memory_subsystem_package.all;
use ahir.Components.all;

entity LoadStoreTB is
  generic (
    addr_width    : integer := MAW;
    data_width    : integer := 16;
    num_req       : integer := 5;
    g_suppr_imm_ack : boolean := false);
end entity LoadStoreTB;


architecture Behave of LoadStoreTB is

    constant request_width : integer := data_width/LAU; 
    constant width : NaturalArray(0 to num_req-1 ) := (others => request_width);

    constant num_loads: integer := 2*request_width;
    constant num_stores: integer := 2*request_width;

    constant tag_width : integer := Maximum(1,Ceil_Log2(num_req));
   
    signal lr_addr_in : std_logic_vector((num_loads*addr_width)-1 downto 0);
    signal lr_req_in  : std_logic_vector(num_loads-1 downto 0);
    signal lr_ack_out : std_logic_vector(num_loads-1 downto 0);
    signal lr_tag_in : std_logic_vector((num_loads*tag_width)-1 downto 0);
 
    signal lc_data_out : std_logic_vector((num_loads*LAU)-1 downto 0);
    signal lc_req_in  : std_logic_vector(num_loads-1 downto 0);
    signal lc_ack_out : std_logic_vector(num_loads-1 downto 0);
    signal lc_tag_out : std_logic_vector((num_loads*tag_width)-1 downto 0);

    signal sr_addr_in : std_logic_vector((num_stores*addr_width)-1 downto 0);
    signal sr_data_in : std_logic_vector((num_stores*LAU)-1 downto 0);
    signal sr_req_in  : std_logic_vector(num_stores-1 downto 0);
    signal sr_ack_out : std_logic_vector(num_stores-1 downto 0);
    signal sr_tag_in : std_logic_vector((num_stores*tag_width)-1 downto 0);

    signal sc_req_in  : std_logic_vector(num_stores-1 downto 0);
    signal sc_ack_out : std_logic_vector(num_stores-1 downto 0);
    signal sc_tag_out : std_logic_vector((num_stores*tag_width)-1 downto 0);

    signal clock : std_logic := '0';  -- only rising edge is used to trigger activity.
    signal reset : std_logic := '1';  -- active high.



    constant ap_int_num_req: integer := num_req;

    signal apint_success_flag: BooleanArray(0 to ap_int_num_req-1) := (others => false);
    signal apint_done_flag: BooleanArray(0 to ap_int_num_req-1) := (others => false);

    signal ap_int_lreq: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_lack: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_lcreq: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_lcack: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_sreq: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_sack: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_screq: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_scack: BooleanArray(0 to ap_int_num_req-1);
    signal ap_int_laddr,ap_int_saddr: ApIntArray(0 to ap_int_num_req-1, addr_width-1 downto 0);
    signal ap_int_lcdata, ap_int_sdata: StdLogicArray2D(0 to ap_int_num_req-1, data_width-1 downto 0);
    
    constant ap_float_num_req: integer := num_req;

    signal apfloat_success_flag: BooleanArray(0 to ap_float_num_req-1) := (others => false);
    signal apfloat_done_flag: BooleanArray(0 to ap_float_num_req-1) := (others => false);

    signal ap_float_lreq: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_lack: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_lcreq: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_lcack: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_sreq: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_sack: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_screq: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_scack: BooleanArray(0 to ap_float_num_req-1);
    signal ap_float_laddr,ap_float_saddr: ApIntArray(0 to ap_float_num_req-1, addr_width-1 downto 0);
    signal ap_float_lcdata, ap_float_sdata: StdLogicArray2D(0 to ap_float_num_req-1, data_width-1 downto 0);

    type   ApIntAddr2D is array(natural range <>) of ApInt(addr_width-1 downto 0);
    signal tmp_ap_int_laddr, tmp_ap_int_saddr, tmp_ap_float_laddr, tmp_ap_float_saddr:
		ApIntAddr2D(0 to num_req-1);

    type   ApIntData2D is array(natural range <>) of std_logic_vector(data_width-1 downto 0);
    signal tmp_ap_int_lcdata, tmp_ap_int_sdata: ApIntData2D(0 to num_req-1);

    type   ApFloatData2D is array(natural range <>) of std_logic_vector(data_width-1 downto 0);
    signal tmp_ap_float_lcdata,tmp_ap_float_sdata: ApFloatData2D(0 to num_req-1);

     procedure Build_Address(tmp_addr: in ApIntAddr2D; signal f_addr: out ApIntArray) is
	variable tmp: ApIntArray(0 to num_req-1, addr_width-1 downto 0);
     begin
        for I in 0 to num_req-1 loop
            Insert(tmp,I,tmp_addr(I));
        end loop;
	f_addr <= tmp;
     end procedure Build_Address;

     procedure Build_ApIntData(tmp_addr: in ApIntData2D; signal f_addr: out StdLogicArray2D) is
	variable tmp: StdLogicArray2D(0 to num_req-1, data_width-1 downto 0);
     begin
        for I in 0 to num_req-1 loop
            Insert(tmp,I,tmp_addr(I));
        end loop;
	f_addr <= tmp;
     end procedure Build_ApIntData;

     procedure Build_ApFloatData(tmp_addr: in ApFloatData2D; signal f_addr: out StdLogicArray2D) is
	variable tmp: StdLogicArray2D(0 to num_req-1, data_width-1 downto 0);
     begin
        for I in 0 to num_req-1 loop
            Insert(tmp,I,tmp_addr(I));
        end loop;
	f_addr <= tmp;
     end procedure Build_ApFloatData;

    constant suppr_imm_ack : BooleanArray(num_req-1 downto 0) := (others => g_suppr_imm_ack);
    
begin

     clock <= not clock after 5 ns;

     process(apint_success_flag, apint_done_flag)
     begin
        if(AndReduce(apint_done_flag))then
           if(AndReduce(apint_success_flag)) then
              assert false report "All ApInt Tests Have Passed" severity note;
	   else
              assert false report "Some ApInt Tests Have Failed" severity error;
	   end if;
        end if;
     end process;
    
     process(apfloat_success_flag, apfloat_done_flag)
     begin
        if(AndReduce(apfloat_done_flag)) then
           if(AndReduce(apfloat_success_flag)) then
              assert false report "All ApFloat Tests Have Passed" severity note;
	   else
              assert false report "Some ApFloat Tests Have Failed" severity error;
	   end if;
        end if;
     end process;

     process(apfloat_done_flag,  apint_done_flag)
     begin
         if(AndReduce(apfloat_done_flag) and AndReduce(apint_done_flag)) then
           if(AndReduce(apint_success_flag) and AndReduce(apfloat_success_flag)) then
              assert false report "All Tests Have Passed" severity note;
	   end if;
	 end if;
     end process;

     process
     begin
	 reset <= '1';
         wait until clock = '1';
         reset <= '0' after 1 ns;
 	 wait;
     end process;

     Build_Address(tmp_ap_int_laddr,ap_int_laddr);
     Build_Address(tmp_ap_int_saddr,ap_int_saddr);

     Build_Address(tmp_ap_float_laddr,ap_float_laddr);
     Build_Address(tmp_ap_float_saddr,ap_float_saddr);

     Build_ApIntData(tmp_ap_int_sdata,ap_int_sdata);
     Build_ApFloatData(tmp_ap_float_sdata,ap_float_sdata);

     GenBlockApInt: for R in 0 to ap_int_num_req-1 generate

       -- write process
       process 
         variable av,dv: natural;
         variable td: std_logic_vector(data_width-1 downto 0);
         variable ta: std_logic_vector(addr_width-1 downto 0);
	 variable counter: natural;
	 variable err_flag : boolean;
       begin 
         ap_int_sreq(R) <= false;	
         ap_int_screq(R) <= false;
         ap_int_lreq(R) <= false;
         ap_int_lcreq(R) <= false;
         counter := 1;
 	 err_flag := false;

         ----------------------------------------------------------------------
         -- first the writes
         ----------------------------------------------------------------------
         
         av := R*request_width;
  	 dv := R + 2**(data_width-1);
         
         wait until reset = '0';
         
         while (av < 2**(addr_width-1)) loop
           
           tmp_ap_int_sdata(R) <= (To_SLV(To_Unsigned(dv,data_width)));
           tmp_ap_int_saddr(R) <= (To_ApInt(To_Unsigned(av,addr_width)));

           wait for 1 ns;

           ap_int_sreq(R) <= true;
	   assert false report "Int Store Request " & Convert_To_String(R) & "," &
		Convert_To_String(counter) & " started" severity note;
           while true loop
             wait until clock = '1';
             ap_int_sreq(R)  <= false;
             if(ap_int_sack(R)) then
		assert false report "Int Store Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
             
           end loop;

           -- write complete?
           ap_int_screq(R) <= true;
           while true loop
             wait until clock = '1';
             ap_int_screq(R) <= false;
             if(ap_int_scack(R)) then
		assert false report "Int Store Complete " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
             
           end loop;

           av := av + (ap_int_num_req*request_width);
	   dv := dv + ap_int_num_req;
	   counter := counter  + 1;
           
         end loop;

         ----------------------------------------------------------------------
         -- now the reads.
         ----------------------------------------------------------------------
         
         av := R*request_width;
  	 dv := R + 2**(data_width-1);
         counter := 1;
         
         while (av < 2**(addr_width-1)) loop

           ap_int_lreq(R) <= true;
           tmp_ap_int_laddr(R) <= (To_ApInt(To_Unsigned(av,addr_width)));

           --------------------------------------------------------------------
           -- load-req
           --------------------------------------------------------------------
           while true loop
             wait until clock = '1';
             ap_int_lreq(R)  <= false;
             if(ap_int_lack(R)) then
		assert false report "Int Load Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
           end loop;


           --------------------------------------------------------------------
           -- load complete
           --------------------------------------------------------------------
           ap_int_lcreq(R) <= true;
           while true loop
             wait until clock = '1';
             ap_int_lcreq(R) <= false;
             if(ap_int_lcack(R)) then
               ----------------------------------------------------------------
               -- check data
               ----------------------------------------------------------------
               td := (Extract(ap_int_lcdata,R));
	       if(td /= To_SLV(To_Unsigned(dv,data_width))) then
			err_flag := true;
	       end if;
               assert td = To_SLV(To_Unsigned(dv,data_width)) report "Mismatch in read-data " &
                 Convert_To_String(R) & "," & Convert_To_String(counter) & " " severity error;
		assert false report "Int Load Complete " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
           end loop;

           av := av + (ap_int_num_req*request_width);
	   dv := dv + ap_int_num_req;
	   counter := counter + 1;
           
         end loop;

	assert err_flag report "ApInt Load/Store Tests Finished Successfully (" & Convert_To_String(R) & ")"
			severity note;
	assert (not err_flag) report "ApInt Load/Store Tests Failed (" & Convert_To_String(R) & ")"
			severity error;

        apint_done_flag(R) <= true;
        apint_success_flag(R) <= not err_flag;

	wait;
       end process;
     end generate GenBlockApInt;

     GenBlockApFloat: for R in 0 to ap_float_num_req-1 generate

       -- write process
       process 
         variable av,dv: natural;
         variable td: std_logic_vector(data_width-1 downto 0);
         variable ta: std_logic_vector(addr_width-1 downto 0);
	 variable counter : integer;
	 variable err_flag : boolean;
       begin 
 	 counter := 1;
	 err_flag := false;
         ap_float_sreq(R) <= false;	
         ap_float_screq(R) <= false;
         ap_float_lreq(R) <= false;
         ap_float_lcreq(R) <= false;
 
         ----------------------------------------------------------------------
         -- first the writes
         ----------------------------------------------------------------------
         
         av := R*request_width + (2**(addr_width-1));
  	 dv := R + 2**(data_width-1);
         
         wait until reset = '0';
         
         while (av < 2**addr_width) loop

           ap_float_sreq(R) <= true;
           
           -- write
           tmp_ap_float_sdata(R) <= (To_SLV(To_Unsigned(dv,data_width)));
           tmp_ap_float_saddr(R) <= (To_ApInt(To_Unsigned(av,addr_width)));

	   assert false report "Float Store Request " & Convert_To_String(R) & "," &
		Convert_To_String(counter) & " started" severity note;

           while true loop
             wait until clock = '1';
             ap_float_sreq(R)  <= false;
             if(ap_float_sack(R)) then
	   	assert false report "Float Store Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
             
           end loop;

           -- write complete?
           ap_float_screq(R) <= true;
	   assert false report "Float Store Complete " & Convert_To_String(R) & "," &
		Convert_To_String(counter) & " started" severity note;
           while true loop
             wait until clock = '1';
             ap_float_screq(R) <= false;
             if(ap_float_scack(R)) then
	   	assert false report "Float Store Complete " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
             
           end loop;

           av := av + (ap_float_num_req*request_width);
	   dv := dv + ap_float_num_req;
	   counter := counter + 1;
           
         end loop;

         ----------------------------------------------------------------------
         -- now the reads.
         ----------------------------------------------------------------------
         
         av := R*request_width + (2**(addr_width-1));
  	 dv := R + 2**(data_width-1);
         
	 counter := 1;
         while (av < 2**addr_width) loop

           ap_float_lreq(R) <= true;
           tmp_ap_float_laddr(R) <= (To_ApInt(To_Unsigned(av,addr_width)));

	   assert false report "Float Load Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " started" severity note;
           --------------------------------------------------------------------
           -- load-req
           --------------------------------------------------------------------
           while true loop
             wait until clock = '1';
             ap_float_lreq(R)  <= false;
             if(ap_float_lack(R)) then
	   	assert false report "Float Load Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               exit;
             end if;
           end loop;


           --------------------------------------------------------------------
           -- load complete
           --------------------------------------------------------------------
           ap_float_lcreq(R) <= true;
	   assert false report "Float Load Complete " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " started" severity note;
           while true loop
             wait until clock = '1';
             ap_float_lcreq(R) <= false;
             if(ap_float_lcack(R)) then
               ----------------------------------------------------------------
               -- check data
               ----------------------------------------------------------------
               td := (Extract(ap_float_lcdata,R));
	   	assert false report "Float Load Complete " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed" severity note;
               assert td = To_SLV(To_Unsigned(dv,data_width)) report "Mismatch in read-data" severity error;
	       if (td /= To_SLV(To_Unsigned(dv,data_width))) then
			err_flag := true;
	       end if;

               exit;
             end if;
           end loop;

           av := av + (ap_float_num_req*request_width);
	   dv := dv + ap_float_num_req;
	   counter := counter + 1;
           
         end loop;

	assert err_flag report "ApFloat Load/Store Tests Finished Successfully (" & Convert_To_String(R) & ")"
			severity note;
	assert (not err_flag) report "ApFloat Load/Store Tests Failed (" & Convert_To_String(R) & ")"
			severity error;

        apfloat_done_flag(R) <= true;
        apfloat_success_flag(R) <= not err_flag;

	wait;
       end process;
     end generate GenBlockApFloat;
     

     --------------------------------------------------------------------------
     -- component instantiations
     --   8 instances: apint LR/LC/SR/SC, apfloat LR/LC/SR/SC
     --------------------------------------------------------------------------
     apIntLR: ApLoadReq
       generic map (width => width, suppress_immediate_ack => suppr_imm_ack)
       port map (
         addr => ap_int_laddr,
         req => ap_int_lreq,
         ack => ap_int_lack,
         mreq => lr_req_in((num_loads/2)-1 downto 0),
         mack => lr_ack_out((num_loads/2)-1 downto 0),
         maddr => lr_addr_in((num_loads/2)*addr_width-1 downto 0),
         mtag => lr_tag_in((num_loads/2)*tag_width-1 downto 0),
         clk => clock,
         reset => reset);

     apIntLC: ApLoadComplete
       generic map (width => width)
       port map (
         req => ap_int_lcreq,
         ack => ap_int_lcack,
	 data => ap_int_lcdata,
         mreq => lc_req_in((num_loads/2)-1 downto 0),
         mack => lc_ack_out((num_loads/2)-1 downto 0),
         mdata => lc_data_out((num_loads/2)*LAU-1 downto 0),
         mtag => lc_tag_out((num_loads/2)*tag_width-1 downto 0),
         clk => clock,
         reset => reset);

     apIntSR: ApStoreReq
       generic map (width => width, suppress_immediate_ack => suppr_imm_ack)       
       port map (
         req => ap_int_sreq,
         ack => ap_int_sack,
         addr => ap_int_saddr,
         data => ap_int_sdata,
         mreq => sr_req_in((num_loads/2)-1 downto 0),
         mack => sr_ack_out((num_loads/2)-1 downto 0),
         mtag => sr_tag_in((num_loads/2)*tag_width-1 downto 0),
	 maddr => sr_addr_in((num_loads/2)*addr_width-1 downto 0),
	 mdata => sr_data_in((num_loads/2)*LAU-1 downto 0),
         clk => clock,
         reset => reset);
       
     apIntSC: ApStoreComplete
       generic map (width => width)
       port map (
         req => ap_int_screq,
         ack => ap_int_scack,
         mreq => sc_req_in((num_loads/2)-1 downto 0),
         mack => sc_ack_out((num_loads/2)-1 downto 0),
         mtag => sc_tag_out((num_loads/2)*tag_width-1 downto 0),
         clk => clock,
         reset => reset);
     


     apFloatLR: ApLoadReq
       generic map (width => width, suppress_immediate_ack => suppr_imm_ack)              
       port map (
         addr => ap_float_laddr,
         req => ap_float_lreq,
         ack => ap_float_lack,
         mreq => lr_req_in((num_loads-1) downto num_loads/2),
         mack => lr_ack_out(num_loads-1 downto num_loads/2),
         maddr => lr_addr_in(num_loads*addr_width-1 downto (num_loads/2)*addr_width),
         mtag => lr_tag_in(num_loads*tag_width-1 downto (num_loads/2)*tag_width),
         clk => clock,
         reset => reset);

     apFloatLC: ApLoadComplete
       generic map (width => width)
       port map (
         req => ap_float_lcreq,
         ack => ap_float_lcack,
	 data => ap_float_lcdata,
         mreq => lc_req_in(num_loads-1 downto num_loads/2),
         mack => lc_ack_out(num_loads-1 downto num_loads/2),
         mdata => lc_data_out(num_loads*LAU-1 downto (num_loads/2)*LAU),
         mtag => lc_tag_out(num_loads*tag_width-1 downto (num_loads/2)*tag_width),
         clk => clock,
         reset => reset);
     
     apFloatSR: ApStoreReq
       generic map (width => width, suppress_immediate_ack => suppr_imm_ack)                     
       port map (
         req => ap_float_sreq,
         ack => ap_float_sack,
         addr => ap_float_saddr,
         data => ap_float_sdata,
         mreq => sr_req_in(num_loads-1 downto num_loads/2),
         mack => sr_ack_out(num_loads-1 downto num_loads/2),
         mtag => sr_tag_in(num_loads*tag_width-1 downto (num_loads/2)*tag_width),
	 maddr => sr_addr_in(num_loads*addr_width-1 downto (num_loads/2)*addr_width),
	 mdata => sr_data_in(num_loads*LAU-1 downto (num_loads/2)*LAU),
         clk => clock,
         reset => reset);
       
     apFloatSC: ApStoreComplete
       generic map (width => width)
       port map (
         req => ap_float_screq,
         ack => ap_float_scack,
         mreq => sc_req_in(num_loads-1 downto num_loads/2),
         mack => sc_ack_out(num_loads-1 downto num_loads/2),
         mtag => sc_tag_out(num_loads*tag_width-1 downto (num_loads/2)*tag_width),
         clk => clock,
         reset => reset);


     memsys: memory_subsystem
           generic map(
		num_loads             => num_loads,
          	num_stores            => num_stores,
          	addr_width            => addr_width,
          	data_width            => LAU,
          	tag_width             => tag_width,
          	number_of_banks       => 1,
          	mux_degree            => 10,
          	demux_degree          => 10,
          	base_bank_addr_width  => MAW,
          	base_bank_data_width  => LAU)
	   port map(
		lr_addr_in  => lr_addr_in,
		lr_req_in   => lr_req_in,
    		lr_ack_out  => lr_ack_out,
    		lr_tag_in   => lr_tag_in,
    		lc_data_out => lc_data_out,
    		lc_req_in   => lc_req_in,
    		lc_ack_out  => lc_ack_out,
    		lc_tag_out  => lc_tag_out,
    		sr_addr_in  => sr_addr_in,
    		sr_data_in  => sr_data_in,
    		sr_req_in   => sr_req_in,
    		sr_ack_out  => sr_ack_out,
    		sr_tag_in   => sr_tag_in,
    		sc_req_in   => sc_req_in,
    		sc_ack_out  => sc_ack_out,
    		sc_tag_out  => sc_tag_out,
    		clock       => clock,
    		reset       => reset);
end Behave;
