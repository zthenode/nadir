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
%#   File: do-hpp.t
%#
%# Author: $author$
%#   Date: 1/15/2020
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
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
///   File: %Done%.hpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef XOS_BASE_%DONE%_HPP
#define XOS_BASE_%DONE%_HPP

#include "xos/base/exception.hpp"

namespace xos {

/// enum %Do%_status
typedef int %Do%_status;
enum {
    /// %Do%...
    %Do%_success = 0,
    %Do%_failed,
    %Do%_busy,
    %Do%_timeout,
    %Do%_interrupted,
    next_%Do%,
    first_%Do% = %Do%_success,
    last_%Do% = %Do%_interrupted,
}; /// enum %Do%_status

/// function %Do%_status_to_chars
inline const char* %Do%_status_to_chars(%Do%_status status) {
    switch(status) {
    /// %Do%...
    case %Do%_success: return "%Do%_success";
    case %Do%_failed: return "%Do%_failed";
    case %Do%_busy: return "%Do%_busy";
    case %Do%_timeout: return "%Do%_timeout";
    case %Do%_interrupted: return "%Do%_interrupted";
    }
    return "unknown";
} /// function %Do%_status_to_chars

/// class %Do%_exceptiont
template <class TExtends = exceptiont<%Do%_status>, class TImplements = typename TExtends::implements>
class exported %Do%_exceptiont: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %Do%_exceptiont derives;

    /// constructor / destructor
    %Do%_exceptiont(const %Do%_exceptiont& copy): extends(copy) {
    }
    %Do%_exceptiont(%Do%_status status): extends(status) {
    }

    /// ...status...
    virtual const char* status_to_chars() const {
        return %Do%_status_to_chars(this->status());
    }
}; /// class %Do%_exceptiont
typedef %Do%_exceptiont<> %Do%_exception;

/// class %Done%t 
template <class TImplements = implement>
class exported %Done%t: virtual public TImplements {
public:
    typedef TImplements implements;
    typedef %Done%t derives;

    typedef xos::%Do%_status %Do%_status;
    enum {
        %Do%_success = xos::%Do%_success,
        %Do%_failed = xos::%Do%_failed,
        %Do%_busy = xos::%Do%_busy,
        %Do%_timeout = xos::%Do%_timeout,
        %Do%_interrupted = xos::%Do%_interrupted
    };
    
    /// %Do%...
    virtual bool %Do%() {
        return (%Do%_success == untimed_%Do%());
    }
    virtual %Do%_status timed_%Do%(mseconds_t milliseconds) {
        return %Do%_success;
    }
    virtual %Do%_status untimed_%Do%() {
        return %Do%_success;
    }
    virtual %Do%_status try_%Do%() {
        return %Do%_success;
    }
}; /// class %Done%t
typedef %Done%t<> %Done%;

namespace extended {
/// class %Do%t
template <class TExtends = extend, class TImplements = implement>
class exported %Do%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %Do%t derives;

    /// constructor / destructor
    %Do%t(%Done%& _%Done%): is_%Done%_(false), %Done%_(_%Done%) {
    }
    virtual ~%Do%t() {
    }
private:
    %Do%t(const %Do%t& copy): is_%Done%_(false), %Done%_(this_%Done%_) {
        throw exception(exception_unexpected);
    }

    virtual bool set_%Done%(bool to = true) {
        is_%Done%_ = to;
        return is_%Done%_;
    }
    virtual bool set_un%Done%(bool to = true) {
        is_%Done%_ = !to;
        return !is_%Done%_;
    }

protected:
    bool is_%Done%_;
    %Done% this_%Done%_, &%Done%_;
}; /// class %Do%t
typedef %Do%t<> %Do%;
} /// namespace extended

/// class %Do%t
template <class TExtends = extended::%Do%, class TImplements = typename TExtends::implements>
class exported %Do%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %Do%t derives;

    /// constructor / destructor
    %Do%t(%Done%& _%Done%, mseconds_t mseconds): extends(_%Done%) {
        %Do%_status status = %Do%_failed;
        if (!(this->is_%Done%_ = (%Do%_success == (status = this->%Done%_.timed_%Do%(mseconds))))) {
            throw %Do%_exception(status);
        }
    }
    %Do%t(%Done%& _%Done%): extends(_%Done%) {
        if (!(this->is_%Done%_ = (this->%Done%_.%Do%()))) {
            throw %Do%_exception(%Do%_failed);
        }
    }
    virtual ~%Do%t() {
    }
private:
    %Do%t(const %Do%t& copy): extends(copy) {
        throw exception(exception_unexpected);
    }
}; /// class %Do%t
typedef %Do%t<> %Do%;

/// class try_%Do%t
template <class TExtends = extended::%Do%, class TImplements = typename TExtends::implements>
class exported try_%Do%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef try_%Do%t derives;

    /// constructor / destructor
    try_%Do%t(%Done%& _%Done%): extends(_%Done%) {
        %Do%_status status = %Do%_failed;
        if (!(this->is_%Done%_ = (%Do%_success == (status = this->%Done%_.try_%Do%())))) {
            throw %Do%_exception(status);
        }
    }
    virtual ~try_%Do%t() {
    }
private:
    try_%Do%t(const try_%Do%t& copy): extends(copy) {
        throw exception(exception_unexpected);
    }
}; /// class try_%Do%t
typedef try_%Do%t<> try_%Do%;

} /// namespace xos

#endif /// ndef XOS_BASE_%DONE%_HPP
)%)%