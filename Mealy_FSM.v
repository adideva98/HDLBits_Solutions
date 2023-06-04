module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );
    parameter A=0,B=1,C=2;
    reg[1:0] state,next_state;
    always@(*)
        case(state)
            A:next_state<=(x==1)?B:A;
            B:next_state<=(x==1)?B:C;
            C:next_state<=(x==1)?B:A;
        endcase
    always@(posedge clk, negedge aresetn)
        begin
            if(!aresetn)
                state<=A;
            else
                state<=next_state;
        end
    always@(*)
        case(state)
            A:z<=0;
            B:z<=0;
            C:z<=(x==1)?1:0;
        endcase

endmodule
