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
%#   File: mt-whats-hpp.t
%#
%# Author: $author$
%#   Date: 1/14/2020
%########################################################################
%with(%
%is_os,%(%else-then(%is_os%,%(%is_Os%)%)%)%,%
%os,%(%else-then(%if-no(%is_os%,,%(%os%)%)%,%(%if-no(%is_os%,,%(os)%)%)%)%)%,%
%Os,%(%else-then(%if-no(%is_os%,,%(%Os%)%)%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_os%,%(%tolower(%Os%)%)%)%)%,%
%is_ifndef_os,%(%else-then(%is_ifndef_os%,%(%is_Ifndef_os%)%)%)%,%
%ifndef_os,%(%else-then(%if-no(%is_ifndef_os%,,%(%ifndef_os%)%)%,%(%if-no(%is_ifndef_os%,,%(%parse(%Os%,/,,%(_)%,,%(%Os%)%,Os)%)%)%)%)%)%,%
%Ifndef_os,%(%else-then(%if-no(%is_ifndef_os%,,%(%Ifndef_os%)%)%,%(%ifndef_os%)%)%)%,%
%IFNDEF_OS,%(%else-then(%IFNDEF_OS%,%(%toupper(%Ifndef_os%)%)%)%)%,%
%ifndef_os,%(%else-then(%_ifndef_os%,%(%tolower(%Ifndef_os%)%)%)%)%,%
%is_namespace_begin,%(%else-then(%is_namespace_begin%,%(%is_Namespace_begin%)%)%)%,%
%namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%namespace_begin%)%)%,%(%if-no(%is_namespace_begin%,,%(%
%%parse(%os%,/,,
,,%(namespace %os% {)%,os)%)%)%)%)%)%,%
%Namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%Namespace_begin%)%)%,%(%namespace_begin%)%)%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%is_namespace_end,%(%else-then(%is_namespace_end%,%(%is_Namespace_end%)%)%)%,%
%namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%namespace_end%)%)%,%(%if-no(%is_namespace_end%,,%(%
%%reverse-parse(%os%,/,,
,,%(} /// namespace %os%)%,os)%)%)%)%)%)%,%
%Namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%Namespace_end%)%)%,%(%namespace_end%)%)%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(what)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%what%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_What%,%(%tolower(%What%)%)%)%)%,%
%is_es,%(%else-then(%is_es%,%(%is_Es%)%)%)%,%
%es,%(%else-then(%if-no(%is_es%,,%(%es%)%)%,%(%if-no(%is_es%,,%(es)%)%)%)%)%,%
%Es,%(%else-then(%if-no(%is_es%,,%(%Es%)%)%,%(%es%)%)%)%,%
%ES,%(%else-then(%ES%,%(%toupper(%Es%)%)%)%)%,%
%es,%(%else-then(%_Es%,%(%tolower(%Es%)%)%)%)%,%
%%(///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2019 $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: %What%%Es%.hpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef XOS_MT_%if-then(%IFNDEF_OS%,_)%%WHAT%%ES%_HPP
#define XOS_MT_%if-then(%IFNDEF_OS%,_)%%WHAT%%ES%_HPP

#include "xos/mt/%What%.hpp"

namespace xos {
namespace mt {%then-if(%Namespace_begin%,
)%

%if-then(%Namespace_end%
)%} /// namespace mt
} /// namespace xos

#endif /// ndef XOS_MT_%if-then(%IFNDEF_OS%,_)%%WHAT%%ES%_HPP
)%)%