entity b10 is
	port (
		r_button : in  bit ;
		g_button : in  bit ;
		key      : in  bit ;
		start    : in  bit ;
		reset    : in  bit ;
		test     : in  bit ;
		cts      : out bit ;
		ctr      : out bit ;
		rts      : in  bit ;
		rtr      : in  bit ;
		clock    : in  bit ;
		v_in     : in  bit_vector(3 downto 0) ;
		v_out    : out bit_vector(3 downto 0)
		) ;
end b10;

architecture BEHAV of b10 is

constant STARTUP:integer:=0;
constant STANDBY:integer:=1;
constant GET_IN:integer:=2;
constant START_TX:integer:=3;
constant SEND:integer:=4;
constant TX_2_RX:integer:=5;
constant RECEIVE:integer:=6;
constant RX_2_TX:integer:=7;
constant END_TX:integer:=8;
constant TEST_1:integer:=9;
constant TEST_2:integer:=10;

begin

	process( reset,clock )

		variable stato  : integer range 10 downto 0;
		variable voto0,voto1,voto2,voto3 : bit;
		variable sign   : bit_vector(3 downto 0);
		variable last_g ,
			 last_r : bit ;
	begin

	    if reset = '1' then
		stato := STARTUP;
		voto0 := '0';
		voto1 := '0';
		voto2 := '0';
		voto3 := '0';
		sign := "0000";
		last_g := '0';
		last_r := '0';
		cts <= '0';
		ctr <= '0';
		v_out <= "0000";
	    elsif clock'event and clock='1' then

		case stato is

		   when STARTUP  => voto0 := '0';
				    voto1 := '0';
				    voto2 := '0';
				    voto3 := '0';
				    cts   <= '0'     ;
				    ctr   <= '0'     ;
				    if ( test = '0' ) then
				       sign  := "0000" ;
				       stato := TEST_1 ;
				    else
				       voto0 := '0';
				       voto1 := '0';
				       voto2 := '0';
				       voto3 := '0';
				       stato := STANDBY ;
				    end if ;

		   when STANDBY  => if start = '1' then
				       voto0 := '0';
				       voto1 := '0';
				       voto2 := '0';
				       voto3 := '0';
				       stato := GET_IN;
				    end if;

				    if rtr = '1' then
				       cts   <= '1';
				    end if ;
				    if rtr = '0' then
				       cts <= '0' ;
				    end if ;

		   when GET_IN    => if start ='0' then
					stato := START_TX ;
				    elsif key ='1' then
				       voto0 := key ;
				       if (( g_button xor last_g )
					  and ( g_button )) = '1' then
					  voto1 := not voto1 ;
				       end if ;
				       if (( r_button xor last_r )
					  and ( r_button )) = '1' then
					  voto2 := not voto2 ;
				       end if ;
				       last_g := g_button ;
				       last_r := r_button ;
				    else
				       voto0 := '0';
				       voto1 := '0';
				       voto2 := '0';
				       voto3 := '0';
				    end if;

		   when START_TX => voto3 := voto0 xor (voto1 xor voto2);
				    stato := SEND;
				    voto0 := '0';
		   when SEND     => if rtr = '1' then
					v_out(0) <= voto0 ;
					v_out(1) <= voto1 ;
					v_out(2) <= voto2 ;
					v_out(3) <= voto3 ;
					cts <= '1' ;
					if voto0 = '0' and voto1 = '1' and voto2 = '1' and voto3 = '0' then
					   stato := END_TX ;
					else
					   stato := TX_2_RX ;
					end if ;
				    end if;
		   when TX_2_RX  => if rts = '0' then
				       ctr <= '1' ;
				       stato := RECEIVE ;
				    end if ;
		   when RECEIVE  => if rts = '1' then
				       voto0 := v_in(0) ;
				       voto1 := v_in(1) ;
				       voto2 := v_in(2) ;
				       voto3 := v_in(3) ;
				       ctr <= '0' ;
				       stato := RX_2_TX ;
				    end if;
		   when RX_2_TX  => if rtr = '0' then
				       cts <= '0' ;
				       stato := SEND ;
				    end if;
		   when END_TX   => if rtr = '0' then
				       cts <= '0' ;
                                       stato := STANDBY ;
				    end if;

		   when TEST_1   => voto0 := v_in(0) ;
				    voto1 := v_in(1) ;
				    voto2 := v_in(2) ;
				    voto3 := v_in(3) ;
				    sign := "1000";
				    if voto0 = '1' and voto1 = '1' and voto2 = '1' and voto3 = '1' then
					stato := TEST_2 ;
				    end if ;

		   when TEST_2   => voto0 := '1' xor sign(0) ;
				    voto0 := '0' xor sign(1) ;
				    voto0 := '0' xor sign(2) ;
				    voto0 := '1' xor sign(3) ;
				    stato := SEND ;

		end case;
	    end if ;
	end process ;
end BEHAV ;
