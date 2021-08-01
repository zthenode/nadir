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
%#   File: mt-derived-what-hpp.t
%#
%# Author: $author$
%#   Date: 1/15/2020
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%(%is_Os%)%)%)%,%
%os,%(%else-then(%if-no(%is_os%,,%(%os%)%)%,%(%if-no(%is_os%,,%(os)%)%)%)%)%,%
%Os,%(%else-then(%if-no(%is_os%,,%(%Os%)%)%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(what)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%what%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_What%,%(%tolower(%What%)%)%)%)%,%
%is_do,%(%else-then(%is_do%,%(%is_Do%)%)%)%,%
%do,%(%else-then(%if-no(%is_do%,,%(%do%)%)%,%(%if-no(%is_do%,,%(do)%)%)%)%)%,%
%Do,%(%else-then(%if-no(%is_do%,,%(%Do%)%)%,%(%do%)%)%)%,%
%DO,%(%else-then(%DO%,%(%toupper(%Do%)%)%)%)%,%
%do,%(%else-then(%_Do%,%(%tolower(%Do%)%)%)%)%,%
%is_undo,%(%else-then(%is_undo%,%(%is_Undo%)%)%)%,%
%undo,%(%else-then(%if-no(%is_undo%,,%(%undo%)%)%,%(%if-no(%is_undo%,,%(un%Do%)%)%)%)%)%,%
%Undo,%(%else-then(%if-no(%is_undo%,,%(%Undo%)%)%,%(%undo%)%)%)%,%
%UNDO,%(%else-then(%UNDO%,%(%toupper(%Undo%)%)%)%)%,%
%undo,%(%else-then(%_Undo%,%(%tolower(%Undo%)%)%)%)%,%
%is_ed,%(%else-then(%is_ed%,%(%is_Ed%)%)%)%,%
%ed,%(%else-then(%if-no(%is_ed%,,%(%ed%)%)%,%(%if-no(%is_ed%,,%(ne)%)%)%)%)%,%
%Ed,%(%else-then(%if-no(%is_ed%,,%(%Ed%)%)%,%(%ed%)%)%)%,%
%ED,%(%else-then(%ED%,%(%toupper(%Ed%)%)%)%)%,%
%ed,%(%else-then(%_Ed%,%(%tolower(%Ed%)%)%)%)%,%
%is_done,%(%else-then(%is_done%,%(%is_Done%)%)%)%,%
%done,%(%else-then(%if-no(%is_done%,,%(%done%)%)%,%(%if-no(%is_done%,,%(%Do%%Ed%)%)%)%)%)%,%
%Done,%(%else-then(%if-no(%is_done%,,%(%Done%)%)%,%(%done%)%)%)%,%
%DONE,%(%else-then(%DONE%,%(%toupper(%Done%)%)%)%)%,%
%done,%(%else-then(%_Done%,%(%tolower(%Done%)%)%)%)%,%
%is_undone,%(%else-then(%is_undone%,%(%is_Undone%)%)%)%,%
%undone,%(%else-then(%if-no(%is_undone%,,%(%undone%)%)%,%(%if-no(%is_undone%,,%(%Undo%%Ed%)%)%)%)%)%,%
%Undone,%(%else-then(%if-no(%is_undone%,,%(%Undone%)%)%,%(%undone%)%)%)%,%
%UNDONE,%(%else-then(%UNDONE%,%(%toupper(%Undone%)%)%)%)%,%
%undone,%(%else-then(%_Undone%,%(%tolower(%Undone%)%)%)%)%,%
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
///   File: %What%.hpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef XOS_MT_%OS%_%WHAT%_HPP
#define XOS_MT_%OS%_%WHAT%_HPP

#include "xos/mt/%What%.hpp"

namespace xos {
namespace mt {
namespace %os% {

namespace derived {
/// class %What%t
template 
<typename T%What% = platform_%What%_t,
 typename TError = platform_%What%_error_t,
 TError VErrorSuccess = platform_%What%_error_success,
 TError VErrorFailed = platform_%What%_error_failed,
 TError VErrorBusy = platform_%What%_error_busy,
 TError VErrorTimeout = platform_%What%_error_timeout,
 TError VErrorInterrupted = platform_%What%_error_interrupted,
 class TExtends = mt::derive::%What%t
 <T%What%, TError, VErrorSuccess, VErrorFailed, VErrorBusy, VErrorTimeout, VErrorInterrupted>, 
 class TImplements = typename TExtends::implements>
class exported %What%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %What%t derives;
    
    typedef T%What% %What%_t;
    typedef typename extends::attached_t attached_t;
    typedef typename extends::unattached_t unattached_t;
    enum { unattached = extends::unattached };

    /// constructor / destructor
    %What%t(attached_t detached, bool is_created, bool is_logged): extends(detached, is_created, is_logged) {
    }
    %What%t(attached_t detached, bool is_created): extends(detached, is_created) {
    }
    %What%t(attached_t detached): extends(detached) {
    }
    %What%t(bool is_logged): extends(is_logged) {
        if (!(this->create())) {
            LOGGER_IS_LOGGED_ERROR("...failed on this->create() throw (create_exception(create_failed))...");
            throw (create_exception(create_failed));
        }
    }
    %What%t(const %What%t& copy): extends(copy) {
    }
    %What%t() {
        if (!(this->create())) {
            LOGGER_IS_LOGGED_ERROR("...failed on this->create() throw (create_exception(create_failed))...");
            throw (create_exception(create_failed));
        }
    }
    virtual ~%What%t() {
        if (!(this->destroyed())) {
            LOGGER_IS_LOGGED_ERROR("...failed on this->destroyed() throw (create_exception(destroy_failed))...");
            throw (create_exception(destroy_failed));
        }
    }

    /// ...%Do%_detached... / ...%Undo%_detached...
    virtual %Do%_status time_%Do%_detached(%What%_t& _%What%, mseconds_t milliseconds) const { 
        return %Do%_failed; 
    }
    virtual %Do%_status timed_%Do%_detached(%What%_t& _%What%, mseconds_t milliseconds) const { 
        return %Do%_failed; 
    }
    virtual %Do%_status try_%Do%_detached(%What%_t& _%What%) const { 
        return %Do%_failed; 
    }
    virtual %Do%_status untimed_%Do%_detached(%What%_t& _%What%) const { 
        return %Do%_failed; 
    }
    virtual bool %Undo%_detached(%What%_t& _%What%) const { 
        return false; 
    }

    /// ...create... / ...destroy...
    virtual attached_t create_detached(%What%_t& _%What%) const {
        attached_t detached = (attached_t)(unattached);
        return detached;
    }
    virtual bool destroy_detached(%What%_t& _%What%) const {
        return false;
    }
}; /// class %What%t
typedef %What%t<> %What%;
} /// namespace derived

} /// namespace %os%
} /// namespace mt
} /// namespace xos

#endif /// ndef XOS_MT_%OS%_%WHAT%_HPP
)%)%