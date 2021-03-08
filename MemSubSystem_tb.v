`timescale 1 ns/10 ps

module Memory_Subsystem_tb;
	reg Clocktb, Cleartb, MARintb, MDRintb, W_sigtb, R_sigtb;
	reg[31:0] BusMuxOuttb;

	wire[31:0] BusMuxInMDRtb; //not sure what to do for this pipeline --> does BusMuxIn-MDR & Address need to be diff sig and inout?

	initial
		begin
		Clocktb = 1;
		Cleartb = 0; 
		MARintb = 0; 
		MDRintb = 1;
		W_sigtb = 1; 
		R_sigtb = 0; 
		BusMuxOuttb = 32'b1111_0000_1111_0000_1111_0000_1111_0000; 
		end
	Memory_Subsystem MSblock(.Clock(Clocktb), .Clear(Cleartb), .MARin(MARintb), .MDRin(MDRintb), .W_sig(W_sigtb), .R_sig(R_sigtb), .BusMuxOut(BusMuxOuttb));
endmodule