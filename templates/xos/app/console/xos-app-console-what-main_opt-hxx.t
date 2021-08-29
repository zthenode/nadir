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
%#   File: xos-app-console-what-main_opt-hxx.t
%#
%# Author: $author$
%#   Date: 6/27/2020
%########################################################################
%with(%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(xos)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(app/console)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_application_ifdef,%(%else-then(%is_application_ifdef%,%(%is_Application_ifdef%)%)%)%,%
%application_ifdef,%(%else-then(%if-no(%is_application_ifdef%,,%(%application_ifdef%)%)%,%(%if-no(%is_application_ifdef%,,%(%parse(%APPLICATION%,/,,,,%(%application%_)%,application)%)%)%)%)%)%,%
%Application_ifdef,%(%else-then(%if-no(%is_application_ifdef%,,%(%Application_ifdef%)%)%,%(%if-no(%is_application_ifdef%,,%(%application_ifdef%)%)%)%)%)%,%
%APPLICATION_IFDEF,%(%else-then(%APPLICATION_IFDEF%,%(%toupper(%Application_ifdef%)%)%)%)%,%
%application_ifdef,%(%else-then(%_application_ifdef%,%(%tolower(%Application_ifdef%)%)%)%)%,%
%is_application_path,%(%else-then(%is_application_path%,%(%is_Application_path%)%)%)%,%
%application_path,%(%else-then(%if-no(%is_application_path%,,%(%application_path%)%)%,%(%if-no(%is_application_path%,,%(%parse(%Application%,/,,,,%(%namespace%/)%,namespace)%)%)%)%)%)%,%
%Application_path,%(%else-then(%if-no(%is_application_path%,,%(%Application_path%)%)%,%(%if-no(%is_application_path%,,%(%application_path%)%)%)%)%)%,%
%APPLICATION_PATH,%(%else-then(%APPLICATION_PATH%,%(%toupper(%Application_path%)%)%)%)%,%
%application_path,%(%else-then(%_application_path%,%(%tolower(%Application_path%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(what)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_namespace,%(%else-then(%is_namespace%,%(%is_Namespace%)%)%)%,%
%namespace,%(%else-then(%if-no(%is_namespace%,,%(%namespace%)%)%,%(%if-no(%is_namespace%,,%(%What%)%)%)%)%)%,%
%Namespace,%(%else-then(%if-no(%is_namespace%,,%(%Namespace%)%)%,%(%if-no(%is_namespace%,,%(%namespace%)%)%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%is_namespace_ifdef,%(%else-then(%is_namespace_ifdef%,%(%is_Namespace_ifdef%)%)%)%,%
%namespace_ifdef,%(%else-then(%if-no(%is_namespace_ifdef%,,%(%namespace_ifdef%)%)%,%(%if-no(%is_namespace_ifdef%,,%(%parse(%NAMESPACE%,/,,,,%(%namespace%_)%,namespace)%)%)%)%)%)%,%
%Namespace_ifdef,%(%else-then(%if-no(%is_namespace_ifdef%,,%(%Namespace_ifdef%)%)%,%(%if-no(%is_namespace_ifdef%,,%(%namespace_ifdef%)%)%)%)%)%,%
%NAMESPACE_IFDEF,%(%else-then(%NAMESPACE_IFDEF%,%(%toupper(%Namespace_ifdef%)%)%)%)%,%
%namespace_ifdef,%(%else-then(%_namespace_ifdef%,%(%tolower(%Namespace_ifdef%)%)%)%)%,%
%is_namespace_path,%(%else-then(%is_namespace_path%,%(%is_Namespace_path%)%)%)%,%
%namespace_path,%(%else-then(%if-no(%is_namespace_path%,,%(%namespace_path%)%)%,%(%if-no(%is_namespace_path%,,%(%parse(%Namespace%,/,,,,%(%namespace%/)%,namespace)%)%)%)%)%)%,%
%Namespace_path,%(%else-then(%if-no(%is_namespace_path%,,%(%Namespace_path%)%)%,%(%if-no(%is_namespace_path%,,%(%namespace_path%)%)%)%)%)%,%
%NAMESPACE_PATH,%(%else-then(%NAMESPACE_PATH%,%(%toupper(%Namespace_path%)%)%)%)%,%
%namespace_path,%(%else-then(%_namespace_path%,%(%tolower(%Namespace_path%)%)%)%)%,%
%is_main,%(%else-then(%is_main%,%(%is_Main%)%)%)%,%
%main,%(%else-then(%if-no(%is_main%,,%(%main%)%)%,%(%if-no(%is_main%,,%(main)%)%)%)%)%,%
%Main,%(%else-then(%if-no(%is_main%,,%(%Main%)%)%,%(%if-no(%is_main%,,%(%main%)%)%)%)%)%,%
%MAIN,%(%else-then(%MAIN%,%(%toupper(%Main%)%)%)%)%,%
%main,%(%else-then(%_main%,%(%tolower(%Main%)%)%)%)%,%
%is_extends_path,%(%else-then(%is_extends_path%,%(%is_Extends_path%)%)%)%,%
%extends_path,%(%else-then(%if-no(%is_extends_path%,,%(%extends_path%)%)%,%(%if-no(%is_extends_path%,,%(%Framework%/app/console)%)%)%)%)%,%
%Extends_path,%(%else-then(%if-no(%is_extends_path%,,%(%Extends_path%)%)%,%(%if-no(%is_extends_path%,,%(%extends_path%)%)%)%)%)%,%
%EXTENDS_PATH,%(%else-then(%EXTENDS_PATH%,%(%toupper(%Extends_path%)%)%)%)%,%
%extends_path,%(%else-then(%_extends_path%,%(%tolower(%Extends_path%)%)%)%)%,%
%is_extends_ns,%(%else-then(%is_extends_ns%,%(%is_Extends_ns%)%)%)%,%
%extends_ns,%(%else-then(%if-no(%is_extends_ns%,,%(%extends_ns%)%)%,%(%if-no(%is_extends_ns%,,%(%Extends_path%)%)%)%)%)%,%
%Extends_ns,%(%else-then(%if-no(%is_extends_ns%,,%(%Extends_ns%)%)%,%(%if-no(%is_extends_ns%,,%(%extends_ns%)%)%)%)%)%,%
%EXTENDS_NS,%(%else-then(%EXTENDS_NS%,%(%toupper(%Extends_ns%)%)%)%)%,%
%extends_ns,%(%else-then(%_extends_ns%,%(%tolower(%Extends_ns%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%(%is_Extends%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%(%extends%)%)%,%(%if-no(%is_extends%,,%(%Main%)%)%)%)%)%,%
%Extends,%(%else-then(%if-no(%is_extends%,,%(%Extends%)%)%,%(%if-no(%is_extends%,,%(%extends%)%)%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_extends%,%(%tolower(%Extends%)%)%)%)%,%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%if-then(%parse(%Extends_path%,::,,/)%,/)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_which,%(%else-then(%is_which%,%(%is_Which%)%)%)%,%
%which,%(%else-then(%if-no(%is_which%,,%(%which%)%)%,%(%if-no(%is_which%,,%(default)%)%)%)%)%,%
%Which,%(%else-then(%if-no(%is_which%,,%(%Which%)%)%,%(%if-no(%is_which%,,%(%which%)%)%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_which%,%(%tolower(%Which%)%)%)%)%,%
%is_run,%(%else-then(%is_run%,%(%is_Run%)%)%)%,%
%run,%(%else-then(%if-no(%is_run%,,%(%run%)%)%,%(%if-no(%is_run%,,%(run)%)%)%)%)%,%
%Run,%(%else-then(%if-no(%is_run%,,%(%Run%)%)%,%(%if-no(%is_run%,,%(%run%)%)%)%)%)%,%
%RUN,%(%else-then(%RUN%,%(%toupper(%Run%)%)%)%)%,%
%run,%(%else-then(%_run%,%(%tolower(%Run%)%)%)%)%,%
%is_which_run,%(%else-then(%is_which_run%,%(%is_Which_run%)%)%)%,%
%which_run,%(%else-then(%if-no(%is_which_run%,,%(%which_run%)%)%,%(%if-no(%is_which_run%,,%(%then-if(%Which%_)%%Run%)%)%)%)%)%,%
%Which_run,%(%else-then(%if-no(%is_which_run%,,%(%Which_run%)%)%,%(%if-no(%is_which_run%,,%(%which_run%)%)%)%)%)%,%
%WHICH_RUN,%(%else-then(%WHICH_RUN%,%(%toupper(%Which_run%)%)%)%)%,%
%which_run,%(%else-then(%_which_run%,%(%tolower(%Which_run%)%)%)%)%,%
%is_is_run,%(%else-then(%is_is_run%,%(%is_Is_run%)%)%)%,%
%is_run,%(%else-then(%if-no(%is_is_run%,,%(%is_run%)%)%,%(%if-no(%is_is_run%,,%(yes)%)%)%)%)%,%
%Is_run,%(%else-then(%if-no(%is_is_run%,,%(%Is_run%)%)%,%(%if-no(%is_is_run%,,%(%is_run%)%)%)%)%)%,%
%IS_RUN,%(%else-then(%IS_RUN%,%(%toupper(%Is_run%)%)%)%)%,%
%is_run,%(%else-then(%_is_run%,%(%tolower(%Is_run%)%)%)%)%,%
%%(///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-%year()% $organization$
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
///   File: %Main%_opt.hpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef %FRAMEWORK%_%APPLICATION_IFDEF%%NAMESPACE_IFDEF%%MAIN%_OPT_HPP
#define %FRAMEWORK%_%APPLICATION_IFDEF%%NAMESPACE_IFDEF%%MAIN%_OPT_HPP

#include "%Include_path%%Extends%.hpp"

namespace %Framework% {%parse(%Application%,/,,,,%(
namespace %namespace% {)%,namespace)%%parse(%Namespace%,/,,,,%(
namespace %namespace% {)%,namespace)%

/// class %Main%_optt
template 
<class TExtends = %parse(%Extends_ns%,/,,,,%(%ns%::)%,ns)%%Extends%, 
 class TImplements = typename TExtends::implements>

class exported %Main%_optt: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %Main%_optt derives;

    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };
    typedef typename extends::string_t string_t;
    typedef typename extends::reader_t reader_t;
    typedef typename extends::writer_t writer_t;
    typedef typename extends::file_t file_t;

    /// constructor / destructor
    %Main%_optt(%if-no(%Is_run%,,%(): %Which_run%_(0)%)%) {
    }
    virtual ~%Main%_optt() {
    }
private:
    %Main%_optt(const %Main%_optt& copy) {
        throw exception(exception_unexpected);
    }

protected:
    typedef typename extends::in_reader_t in_reader_t;
    typedef typename extends::out_writer_t out_writer_t;
    typedef typename extends::err_writer_t err_writer_t;

%if-no(%Is_run%,,%(    /// ...run
    int (derives::*%Which_run%_)(int argc, char_t** argv, char_t** env);
    virtual int %Which_run%(int argc, char_t** argv, char_t** env) {
        int err = 0;
        if ((%Which_run%_)) {
            err = (this->*%Which_run%_)(argc, argv, env);
        } else {
            err = extends::%Which_run%(argc, argv, env);
        }
        return err;
    }

)%)%protected:
}; /// class %Main%_optt
typedef %Main%_optt<> %Main%_opt;

%reverse-parse(%Namespace%,/,,,,%(} /// namespace %namespace%
)%,namespace)%%reverse-parse(%Application%,/,,,,%(} /// namespace %namespace%
)%,namespace)%} /// namespace %Framework%

#endif /// ndef %FRAMEWORK%_%APPLICATION_IFDEF%%NAMESPACE_IFDEF%%MAIN%_OPT_HPP
)%)%