%########################################################################
%# Copyright (c) 1988-2020 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: main-which-run-hxx.t
%#
%# Author: $author$
%#   Date: 6/25/2020
%########################################################################
%with(%
%is_which,%(%else-then(%is_which%,%(%is_Which%)%)%)%,%
%which,%(%else-then(%if-no(%is_which%,,%(%which%)%)%,%(%if-no(%is_which%,,%(which)%)%)%)%)%,%
%Which,%(%else-then(%if-no(%is_which%,,%(%Which%)%)%,%(%if-no(%is_which%,,%(%which%)%)%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_which%,%(%tolower(%Which%)%)%)%)%,%
%is_run,%(%else-then(%is_run%,%(%is_Run%)%)%)%,%
%run,%(%else-then(%if-no(%is_run%,,%(%run%)%)%,%(%if-no(%is_run%,,%(run)%)%)%)%)%,%
%Run,%(%else-then(%if-no(%is_run%,,%(%Run%)%)%,%(%if-no(%is_run%,,%(%run%)%)%)%)%)%,%
%RUN,%(%else-then(%RUN%,%(%toupper(%Run%)%)%)%)%,%
%run,%(%else-then(%_run%,%(%tolower(%Run%)%)%)%)%,%
%is_params,%(%else-then(%is_params%,%(%is_Params%)%)%)%,%
%params,%(%else-then(%if-no(%is_params%,,%(%params%)%)%,%(%if-no(%is_params%,,%()%)%)%)%)%,%
%Params,%(%else-then(%if-no(%is_params%,,%(%Params%)%)%,%(%if-no(%is_params%,,%(%params%)%)%)%)%)%,%
%PARAMS,%(%else-then(%PARAMS%,%(%toupper(%Params%)%)%)%)%,%
%params,%(%else-then(%_params%,%(%tolower(%Params%)%)%)%)%,%
%is_args,%(%else-then(%is_args%,%(%is_Args%)%)%)%,%
%args,%(%else-then(%if-no(%is_args%,,%(%args%)%)%,%(%if-no(%is_args%,,%()%)%)%)%)%,%
%Args,%(%else-then(%if-no(%is_args%,,%(%Args%)%)%,%(%if-no(%is_args%,,%(%args%)%)%)%)%)%,%
%ARGS,%(%else-then(%ARGS%,%(%toupper(%Args%)%)%)%)%,%
%args,%(%else-then(%_args%,%(%tolower(%Args%)%)%)%)%,%
%is_returntype,%(%else-then(%is_returntype%,%(%is_ReturnType%)%)%)%,%
%returntype,%(%else-then(%if-no(%is_returntype%,,%(%returntype%)%)%,%(%if-no(%is_returntype%,,%(int)%)%)%)%)%,%
%ReturnType,%(%else-then(%if-no(%is_returntype%,,%(%ReturnType%)%)%,%(%if-no(%is_returntype%,,%(%returntype%)%)%)%)%)%,%
%RETURNTYPE,%(%else-then(%RETURNTYPE%,%(%toupper(%ReturnType%)%)%)%)%,%
%returntype,%(%else-then(%_returntype%,%(%tolower(%ReturnType%)%)%)%)%,%
%is_return,%(%else-then(%is_return%,%(%is_Return%)%)%)%,%
%return,%(%else-then(%if-no(%is_return%,,%(%return%)%)%,%(%if-no(%is_return%,,%(err)%)%)%)%)%,%
%Return,%(%else-then(%if-no(%is_return%,,%(%Return%)%)%,%(%if-no(%is_return%,,%(%return%)%)%)%)%)%,%
%RETURN,%(%else-then(%RETURN%,%(%toupper(%Return%)%)%)%)%,%
%return,%(%else-then(%_return%,%(%tolower(%Return%)%)%)%)%,%
%is_returnvalue,%(%else-then(%is_returnvalue%,%(%is_ReturnValue%)%)%)%,%
%returnvalue,%(%else-then(%if-no(%is_returnvalue%,,%(%returnvalue%)%)%,%(%if-no(%is_returnvalue%,,%(0)%)%)%)%)%,%
%ReturnValue,%(%else-then(%if-no(%is_returnvalue%,,%(%ReturnValue%)%)%,%(%if-no(%is_returnvalue%,,%(%returnvalue%)%)%)%)%)%,%
%RETURNVALUE,%(%else-then(%RETURNVALUE%,%(%toupper(%ReturnValue%)%)%)%)%,%
%returnvalue,%(%else-then(%_returnvalue%,%(%tolower(%ReturnValue%)%)%)%)%,%
%is_stdparams,%(%else-then(%is_stdparams%,%(%is_StdParams%)%)%)%,%
%stdparams,%(%else-then(%if-no(%is_stdparams%,,%(%stdparams%)%)%,%(%if-no(%is_stdparams%,,%(int argc, char_t** argv, char_t** env)%)%)%)%)%,%
%StdParams,%(%else-then(%if-no(%is_stdparams%,,%(%StdParams%)%)%,%(%if-no(%is_stdparams%,,%(%stdparams%)%)%)%)%)%,%
%STDPARAMS,%(%else-then(%STDPARAMS%,%(%toupper(%StdParams%)%)%)%)%,%
%stdparams,%(%else-then(%_stdparams%,%(%tolower(%StdParams%)%)%)%)%,%
%is_stdargs,%(%else-then(%is_stdargs%,%(%is_StdArgs%)%)%)%,%
%stdargs,%(%else-then(%if-no(%is_stdargs%,,%(%stdargs%)%)%,%(%if-no(%is_stdargs%,,%(argc, argv, env)%)%)%)%)%,%
%StdArgs,%(%else-then(%if-no(%is_stdargs%,,%(%StdArgs%)%)%,%(%if-no(%is_stdargs%,,%(%stdargs%)%)%)%)%)%,%
%STDARGS,%(%else-then(%STDARGS%,%(%toupper(%StdArgs%)%)%)%)%,%
%stdargs,%(%else-then(%_stdargs%,%(%tolower(%StdArgs%)%)%)%)%,%
%%(
    /// ...%if-then(%Which%,_)%%Run%
    virtual %ReturnType% %if-then(%Which%,_)%%Run%(%if-then(%Params%,%(%if(%StdParams%,%(, )%)%)%)%%StdParams%) {
        %ReturnType% %Return% = %ReturnValue%;
        return %Return%;
    }
    virtual %ReturnType% before_%if-then(%Which%,_)%%Run%(%if-then(%Params%,%(%if(%StdParams%,%(, )%)%)%)%%StdParams%) {
        %ReturnType% %Return% = %ReturnValue%;
        return %Return%;
    }
    virtual %ReturnType% after_%if-then(%Which%,_)%%Run%(%if-then(%Params%,%(%if(%StdParams%,%(, )%)%)%)%%StdParams%) {
        %ReturnType% %Return% = %ReturnValue%;
        return %Return%;
    }
    virtual %ReturnType% all_%if-then(%Which%,_)%%Run%(%if-then(%Params%,%(%if(%StdParams%,%(, )%)%)%)%%StdParams%) {
        %ReturnType% %Return% = %ReturnValue%;
        if (!(err = before_%if-then(%Which%,_)%%Run%(%if-then(%Args%,%(%if(%StdArgs%,%(, )%)%)%)%%StdArgs%))) {
            int err2 = 0;
            err = %if-then(%Which%,_)%%Run%(%if-then(%Args%,%(%if(%StdArgs%,%(, )%)%)%)%%StdArgs%);
            if ((err2 = after_%if-then(%Which%,_)%%Run%(%if-then(%Args%,%(%if(%StdArgs%,%(, )%)%)%)%%StdArgs%))) {
                if (!(err)) err = err2;
            }
        }
        return %Return%;
    }
)%)%