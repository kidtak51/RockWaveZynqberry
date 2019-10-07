-- led_ctrl.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_ctrl is
    Port ( clk_ip      : in   std_logic;
           led_op      : out  std_logic;
           interval_ip : in   std_logic_vector( 31 downto 0)
           );
end led_ctrl;

architecture Behavioral of led_ctrl is
	signal clk         :	std_logic;
	signal led_toggle  :	std_logic;
	signal count	:  std_logic_vector( 31 downto 0);
	signal interval :  std_logic_vector( 31 downto 0);
begin
	clk	<=	clk_ip;
	led_op	<= led_toggle;
	process(clk) begin
		if(clk'event and clk='1') then
		    if(interval /= interval_ip) then
				count <= X"00000000";
			elsif(count = interval) then
			    if( count /= 0 ) then
				    count <= X"00000000";
				    led_toggle <= not led_toggle;
				end if;
			else
				count <= count + 1;
			end if;
		end if;
	end process;

	process(clk) begin
		if(clk'event and clk='1') then
   			interval <= interval_ip;
		end if;
	end process;
end Behavioral;
