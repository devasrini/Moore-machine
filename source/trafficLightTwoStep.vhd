----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.01.2021 02:14:26
-- Design Name: 
-- Module Name: traffic_light_threestep - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_light_twostep is
Port (
rst : in std_logic;
clck : in std_logic;
r,g,y : out std_logic
 );
 end traffic_light_twostep;

architecture Behavioral of traffic_light_twostep is
type state_type is (init,red,green,yellow);
signal state,next_state: state_type;
begin
reset_process: process(clck)
begin
if(rising_edge(clck)) then
if(rst = '1') then
  state <= init;
else
  state <= next_state;
end if;
end if;
end process reset_process;
--process_output: process(clck)
--begin 
--if(rising_edge(clck)) then
--case(state) is
--when init=>
-- r <= '0';
-- g <='0';
-- y <= '0';
--when red=>
-- r <= '1';
-- g <='0';
-- y <= '0';
--when yellow=>
--r <= '0';
--g <='0';
--y <= '1';
--when green =>
--r <= '0';
--g <='1';
--y <= '0';
--end case;
--end if;
--end process process_output;
process_nextstate: process(state)
begin 
--if(rising_edge(clck)) then

case(state) is
when init =>
    r <= '0';
    g <='0';
    y <= '0';
    next_state <= red;
when red =>
   r <= '1';
   g <='0';
   y <= '0';
   next_state <= yellow;
when yellow =>
   r <= '0';
   g <='0';
   y <= '1';
   next_state <= green;
when green =>
   r <= '0';
   g <='1';
   y <= '0';
   next_state <= red;
end case;
--end if;
end process process_nextstate;
end Behavioral;
