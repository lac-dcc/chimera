-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

USE work.cpu86pack.ALL;
USE work.cpu86instr.ALL;

ENTITY biufsm IS
   PORT( 
      clk          : IN     std_logic;
      flush_coming : IN     std_logic;
      flush_req    : IN     std_logic;
      irq_req      : IN     std_logic;
      irq_type     : IN     std_logic_vector (1 DOWNTO 0);
      opc_req      : IN     std_logic;
      read_req     : IN     std_logic;
      reg1freed    : IN     std_logic;                      -- Delayed version (1 clk) of reg1free
      reg4free     : IN     std_logic;
      regnbok      : IN     std_logic;
      reset        : IN     std_logic;
      w_biufsm_s   : IN     std_logic;
      write_req    : IN     std_logic;
      addrplus4    : OUT    std_logic;
      biu_error    : OUT    std_logic;
      biu_status   : OUT    std_logic_vector (2 DOWNTO 0);
      irq_ack      : OUT    std_logic;
      irq_clr      : OUT    std_logic;
      latchabus    : OUT    std_logic;
      latchclr     : OUT    std_logic;
      latchm       : OUT    std_logic;
      latcho       : OUT    std_logic;
      latchrw      : OUT    std_logic;
      ldposplus1   : OUT    std_logic;
      muxabus      : OUT    std_logic_vector (1 DOWNTO 0);
      rdcode_s     : OUT    std_logic;
      rddata_s     : OUT    std_logic;
      regplus1     : OUT    std_logic;
      rw_ack       : OUT    std_logic;
      wr_s         : OUT    std_logic;
      flush_ack    : BUFFER std_logic;
      inta1        : BUFFER std_logic
   );
END biufsm ;

 
ARCHITECTURE fsm OF biufsm IS

   signal ws_s : std_logic_vector(WS_WIDTH-1 downto 0);
   signal oddflag_s  : std_logic;
   signal rwmem3_s : std_logic; -- Misaligned Read/Write cycle

   TYPE STATE_TYPE IS (
      Sreset,
      Sws,
      Smaxws,
      Sack,
      Srdopc,
      Serror,
      Swrite,
      Swsw,
      Smaxwsw,
      Sackw,
      Swrodd,
      Sread,
      Srdodd,
      Swsr,
      Smaxwsr,
      Sackr,
      Sflush1,
      Sfull,
      Sint,
      Sintws2,
      Sflush2,
      Sintws1
   );
 
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   SIGNAL biu_error_int : std_logic ;
   SIGNAL biu_status_cld : std_logic_vector (2 DOWNTO 0);

BEGIN

   clocked_proc : PROCESS (clk,reset)
   BEGIN
      IF (reset = '1') THEN
         current_state <= Sreset;
         biu_error <= '0';
         biu_status_cld <= "011";
         oddflag_s <= '0';
         ws_s <= (others=>'0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         biu_error <= biu_error_int;
         ws_s <= (others=>'0');

         CASE current_state IS
            WHEN Sreset => 
               biu_status_cld<="000";
            WHEN Sws => 
               ws_s <= ws_s + '1';
               IF (flush_req = '1') THEN 
                  biu_status_cld<="011";
               END IF;
            WHEN Smaxws => 
               IF (flush_req = '1') THEN 
                  biu_status_cld<="011";
               END IF;
            WHEN Sack => 
               oddflag_s<='0';
               IF (write_req = '1') THEN 
                  biu_status_cld<="010";
               ELSIF (read_req = '1') THEN 
                  biu_status_cld<="001";
               ELSIF (flush_req = '1') THEN 
                  biu_status_cld<="011";
               ELSIF (irq_req='1' AND opc_req='1') THEN 
                  biu_status_cld<="100";
               ELSIF (reg4free = '1' AND
                      flush_coming='0' AND
                      irq_req='0') THEN 
                  biu_status_cld<="000";
               ELSIF (regnbok = '0' and 
                      reg4free = '0') THEN 
               ELSE
                  biu_status_cld<="011";
               END IF;
            WHEN Srdopc => 
               ws_s <= (others=>'0');
               IF (flush_req = '1') THEN 
                  biu_status_cld<="011";
               END IF;
            WHEN Swrite => 
               ws_s <= (others=>'0');
               oddflag_s<='0';
            WHEN Swsw => 
               ws_s <= ws_s + '1';
            WHEN Sackw => 
               IF (rwmem3_s = '1') THEN 
               ELSIF (flush_req = '1') THEN 
                  biu_status_cld<="011";
               ELSIF (irq_req='1' AND opc_req='1') THEN 
                  biu_status_cld<="100";
               ELSIF (reg4free = '1' ) THEN 
                  biu_status_cld<="000";
               ELSIF (flush_coming='1' OR
                      (irq_req='1' AND opc_req='0')) THEN 
                  biu_status_cld<="011";
               END IF;
            WHEN Swrodd => 
               ws_s <= (others=>'0');
               oddflag_s<='1';
            WHEN Sread => 
               ws_s <= (others=>'0');
               oddflag_s<='0';
            WHEN Srdodd => 
               ws_s <= (others=>'0');
               oddflag_s<='1';
            WHEN Swsr => 
               ws_s <= ws_s + '1';
            WHEN Sackr => 
               IF (rwmem3_s = '1') THEN 
               ELSIF (flush_req='1') THEN 
                  biu_status_cld<="011";
               ELSIF (irq_req='1' AND opc_req='1') THEN 
                  biu_status_cld<="100";
               ELSIF (reg4free = '1' ) THEN 
                  biu_status_cld<="000";
               ELSIF (flush_coming='1' OR
                      (irq_req='1' AND opc_req='0')) THEN 
                  biu_status_cld<="011";
               END IF;
            WHEN Sfull => 
               IF (write_req='1') THEN 
                  biu_status_cld<="010";
               ELSIF (read_req='1') THEN 
                  biu_status_cld<="001";
               ELSIF (flush_req = '1') THEN 
                  biu_status_cld<="011";
               ELSIF (irq_req='1' AND opc_req='1') THEN 
                  biu_status_cld<="100";
               ELSIF (reg4free = '1' AND 
                      flush_coming='0' AND
                      irq_req='0') THEN 
                  biu_status_cld<="000";
               END IF;
            WHEN Sintws2 => 
               biu_status_cld<="011";
            WHEN Sflush2 => 
               biu_status_cld<="000";
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      flush_coming,
      flush_req,
      irq_req,
      irq_type,
      opc_req,
      read_req,
      reg1freed,
      reg4free,
      regnbok,
      rwmem3_s,
      write_req,
      ws_s
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      addrplus4 <= '0';
      biu_error_int <= '0';
      irq_ack <= '0';
      irq_clr <= '0';
      latchabus <= '0';
      latchclr <= '0';
      latchm <= '0';
      latcho <= '0';
      latchrw <= '0';
      ldposplus1 <= '0';
      muxabus <= "00";
      rdcode_s <= '0';
      rddata_s <= '0';
      regplus1 <= '0';
      rw_ack <= '0';
      wr_s <= '0';
      flush_ack <= '0';
      inta1 <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN Sreset => 
            latchrw <= '1' ;
            next_state <= Srdopc;
         WHEN Sws => 
            IF (flush_req = '1') THEN 
               next_state <= Sflush1;
            ELSIF (ws_s=MAX_WS-1) THEN 
               next_state <= Smaxws;
            ELSE
               next_state <= Sws;
            END IF;
         WHEN Smaxws => 
            latchabus<='1';
            addrplus4<='1'; 
            latchclr <= '1' ;
            ldposplus1<='1';
            IF (flush_req = '1') THEN 
               next_state <= Sflush1;
            ELSE
               next_state <= Sack;
            END IF;
         WHEN Sack => 
            latchm<=reg1freed; 
            regplus1<='1';
            IF (write_req = '1') THEN 
               muxabus <="01";
               latchrw <= '1' ;
               next_state <= Swrite;
            ELSIF (read_req = '1') THEN 
               muxabus <="01";
               latchrw <= '1' ;
               next_state <= Sread;
            ELSIF (flush_req = '1') THEN 
               next_state <= Sflush1;
            ELSIF (irq_req='1' AND opc_req='1') THEN 
               irq_ack<='1';
               next_state <= Sint;
            ELSIF (reg4free = '1' AND
                   flush_coming='0' AND
                   irq_req='0') THEN 
               latchrw <= '1' ;
               next_state <= Srdopc;
            ELSIF (regnbok = '0' and 
                   reg4free = '0') THEN 
               next_state <= Serror;
            ELSE
               next_state <= Sfull;
            END IF;
         WHEN Srdopc => 
            rdcode_s <= '1';
            latcho <= regnbok and opc_req;
            IF (flush_req = '1') THEN 
               next_state <= Sflush1;
            ELSIF (ws_s/=MAX_WS) THEN 
               next_state <= Sws;
            ELSE
               next_state <= Smaxws;
            END IF;
         WHEN Serror => 
            biu_error_int <= '1';
            next_state <= Serror;
         WHEN Swrite => 
            wr_s <= '1';
            IF (ws_s/=MAX_WS) THEN 
               next_state <= Swsw;
            ELSE
               next_state <= Smaxwsw;
            END IF;
         WHEN Swsw => 
            latcho <= regnbok and opc_req;
            IF (ws_s=MAX_WS-1) THEN 
               next_state <= Smaxwsw;
            ELSE
               next_state <= Swsw;
            END IF;
         WHEN Smaxwsw => 
            latcho <= regnbok and opc_req;
            latchclr <= '1' ;
            rw_ack<= not rwmem3_s;
            next_state <= Sackw;
         WHEN Sackw => 
            latcho <= regnbok and opc_req;
            IF (rwmem3_s = '1') THEN 
               muxabus <="10";
               latchrw<='1';
               next_state <= Swrodd;
            ELSIF (flush_req = '1') THEN 
               next_state <= Sflush1;
            ELSIF (irq_req='1' AND opc_req='1') THEN 
               irq_ack<='1';
               next_state <= Sint;
            ELSIF (reg4free = '1' ) THEN 
               muxabus <="00";
               latchrw<='1';
               next_state <= Srdopc;
            ELSIF (flush_coming='1' OR
                   (irq_req='1' AND opc_req='0')) THEN 
               next_state <= Sfull;
            ELSIF (regnbok = '0' and 
                   reg4free = '0') THEN 
               next_state <= Serror;
            ELSE
               muxabus <="00";
               next_state <= Sack;
            END IF;
         WHEN Swrodd => 
            latcho <= regnbok and opc_req;
            wr_s <= '1';
            IF (ws_s/=MAX_WS) THEN 
               next_state <= Swsw;
            ELSE
               next_state <= Smaxwsw;
            END IF;
         WHEN Sread => 
            rddata_s <= '1';
            IF (ws_s/=MAX_WS) THEN 
               next_state <= Swsr;
            ELSE
               next_state <= Smaxwsr;
            END IF;
         WHEN Srdodd => 
            rddata_s <= '1';
            IF (ws_s/=MAX_WS) THEN 
               next_state <= Swsr;
            ELSE
               next_state <= Smaxwsr;
            END IF;
         WHEN Swsr => 
            IF (ws_s=MAX_WS-1) THEN 
               next_state <= Smaxwsr;
            ELSE
               next_state <= Swsr;
            END IF;
         WHEN Smaxwsr => 
            latchclr <= '1' ;
            rw_ack<= not rwmem3_s;
            next_state <= Sackr;
         WHEN Sackr => 
            IF (rwmem3_s = '1') THEN 
               muxabus <="10";
               latchrw <= '1';
               next_state <= Srdodd;
            ELSIF (flush_req='1') THEN 
               next_state <= Sflush1;
            ELSIF (irq_req='1' AND opc_req='1') THEN 
               irq_ack<='1';
               next_state <= Sint;
            ELSIF (reg4free = '1' ) THEN 
               muxabus <="00";
                latchrw<='1';
               next_state <= Srdopc;
            ELSIF (flush_coming='1' OR
                   (irq_req='1' AND opc_req='0')) THEN 
               next_state <= Sfull;
            ELSIF (regnbok = '0' and 
                   reg4free = '0') THEN 
               next_state <= Serror;
            ELSE
               muxabus <="00";
               next_state <= Sack;
            END IF;
         WHEN Sflush1 => 
            flush_ack<='1';
            IF (flush_req='0') THEN 
               muxabus<="01";
               next_state <= Sflush2;
            ELSE
               next_state <= Sflush1;
            END IF;
         WHEN Sfull => 
            latcho <= regnbok and opc_req;
            IF (write_req='1') THEN 
               muxabus <="01";
               latchrw <= '1' ;
               next_state <= Swrite;
            ELSIF (read_req='1') THEN 
               muxabus <="01";
               latchrw <= '1' ;
               next_state <= Sread;
            ELSIF (flush_req = '1') THEN 
               next_state <= Sflush1;
            ELSIF (irq_req='1' AND opc_req='1') THEN 
               irq_ack<='1';
               next_state <= Sint;
            ELSIF (reg4free = '1' AND 
                   flush_coming='0' AND
                   irq_req='0') THEN 
               latchrw <= '1' ;
               next_state <= Srdopc;
            ELSIF (regnbok = '0' and 
                   reg4free = '0') THEN 
               next_state <= Serror;
            ELSE
               next_state <= Sfull;
            END IF;
         WHEN Sint => 
            latcho <= opc_req;
            if irq_type="00" then inta1<='1';
            end if;
            irq_ack<='1';
            next_state <= Sintws1;
         WHEN Sintws2 => 
            if irq_type="00" then 
            inta1<='1';
            end if;
            irq_clr <= '1';
            next_state <= Sfull;
         WHEN Sflush2 => 
            latchabus<='1';
            addrplus4<='0'; 
            latchrw <= '1' ;
            muxabus <="01";
            next_state <= Srdopc;
         WHEN Sintws1 => 
            if irq_type="00" then 
            inta1<='1';
            end if;
            next_state <= Sintws2;
         WHEN OTHERS =>
            next_state <= Sreset;
      END CASE;
   END PROCESS nextstate_proc;
 
   biu_status <= biu_status_cld;
   rwmem3_s <= '1' when (w_biufsm_s='1' and oddflag_s='0') else '0';
END fsm;
