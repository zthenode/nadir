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
%#   File: derived-mutex-hpp.t
%#
%# Author: $author$
%#   Date: 1/2/2020
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(mutex)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%what%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_What%,%(%tolower(%What%)%)%)%)%,%
%is_do,%(%else-then(%is_do%,%(%is_Do%)%)%)%,%
%do,%(%else-then(%if-no(%is_do%,,%(%do%)%)%,%(%if-no(%is_do%,,%(lock)%)%)%)%)%,%
%Do,%(%else-then(%if-no(%is_do%,,%(%Do%)%)%,%(%do%)%)%)%,%
%DO,%(%else-then(%DO%,%(%toupper(%Do%)%)%)%)%,%
%do,%(%else-then(%_Do%,%(%tolower(%Do%)%)%)%)%,%
%is_undo,%(%else-then(%is_undo%,%(%is_Undo%)%)%)%,%
%undo,%(%else-then(%if-no(%is_undo%,,%(%undo%)%)%,%(%if-no(%is_undo%,,%(unlock)%)%)%)%)%,%
%Undo,%(%else-then(%if-no(%is_undo%,,%(%Undo%)%)%,%(%undo%)%)%)%,%
%UNDO,%(%else-then(%UNDO%,%(%toupper(%Undo%)%)%)%)%,%
%undo,%(%else-then(%_Undo%,%(%tolower(%Undo%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%(%is_Organization%)%)%)%,%
%organization,%(%else-then(%if-no(%is_organization%,,%(%organization%)%)%,%(%if-no(%is_organization%,,%($organization$)%)%)%)%)%,%
%Organization,%(%else-then(%if-no(%is_organization%,,%(%Organization%)%)%,%(%organization%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%(%is_Author%)%)%)%,%
%author,%(%else-then(%if-no(%is_author%,,%(%author%)%)%,%(%if-no(%is_author%,,%($author$)%)%)%)%)%,%
%Author,%(%else-then(%if-no(%is_author%,,%(%Author%)%)%,%(%author%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%(%is_Os%)%)%)%,%
%os,%(%else-then(%if-no(%is_os%,,%(%os%)%)%,%(%if-no(%is_os%,,%(os)%)%)%)%)%,%
%Os,%(%else-then(%if-no(%is_os%,,%(%Os%)%)%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%is_namespace,%(%else-then(%is_namespace%,%(%is_Namespace%)%)%)%,%
%namespace,%(%else-then(%if-no(%is_namespace%,,%(%namespace%)%)%,%(%if-no(%is_namespace%,,%(xos/mt/%Os%)%)%)%)%)%,%
%Namespace,%(%else-then(%if-no(%is_namespace%,,%(%Namespace%)%)%,%(%namespace%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_Namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%is_ifndef,%(%else-then(%is_ifndef%,%(%is_Ifndef%)%)%)%,%
%ifndef,%(%else-then(%if-no(%is_ifndef%,,%(%ifndef%)%)%,%(%if-no(%is_ifndef%,,%(%else-then(%Namespace%,xos/base)%)%)%)%)%)%,%
%Ifndef,%(%else-then(%if-no(%is_ifndef%,,%(%Ifndef%)%)%,%(%ifndef%)%)%)%,%
%Ifndef,%(%parse(%Ifndef%,/,,_)%)%,%
%IFNDEF,%(%else-then(%IFNDEF%,%(%toupper(%Ifndef%)%)%)%)%,%
%ifndef,%(%else-then(%_Ifndef%,%(%tolower(%Ifndef%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%What%.hpp)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Name%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%filebase(%File%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%fileextension(%File%)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_h,%(%else-then(%is_h%,%(%is_H%)%)%)%,%
%h,%(%else-then(%if-no(%is_h%,,%(%h%)%)%,%(%if-no(%is_h%,,%(%equal(h,%Extension%)%)%)%)%)%)%,%
%H,%(%else-then(%if-no(%is_h%,,%(%H%)%)%,%(%h%)%)%)%,%
%H,%(%else-then(%H%,%(%toupper(%H%)%)%)%)%,%
%h,%(%else-then(%_H%,%(%tolower(%H%)%)%)%)%,%
%is_c,%(%else-then(%is_c%,%(%is_C%)%)%)%,%
%c,%(%else-then(%if-no(%is_c%,,%(%c%)%)%,%(%if-no(%is_c%,,%(%equal(c,%Extension%)%)%)%)%)%)%,%
%C,%(%else-then(%if-no(%is_c%,,%(%C%)%)%,%(%c%)%)%)%,%
%C,%(%else-then(%C%,%(%toupper(%C%)%)%)%)%,%
%c,%(%else-then(%_C%,%(%tolower(%C%)%)%)%)%,%
%is_hxx,%(%else-then(%is_hxx%,%(%is_Hxx%)%)%)%,%
%hxx,%(%else-then(%if-no(%is_hxx%,,%(%hxx%)%)%,%(%if-no(%is_hxx%,,%(%if(%H%%C%,h,hpp)%)%)%)%)%)%,%
%Hxx,%(%else-then(%if-no(%is_hxx%,,%(%Hxx%)%)%,%(%hxx%)%)%)%,%
%HXX,%(%else-then(%HXX%,%(%toupper(%Hxx%)%)%)%)%,%
%hxx,%(%else-then(%_Hxx%,%(%tolower(%Hxx%)%)%)%)%,%
%is_cxx,%(%else-then(%is_cxx%,%(%is_Cxx%)%)%)%,%
%cxx,%(%else-then(%if-no(%is_cxx%,,%(%cxx%)%)%,%(%if-no(%is_cxx%,,%(%Extension%)%)%)%)%)%,%
%Cxx,%(%else-then(%if-no(%is_cxx%,,%(%Cxx%)%)%,%(%cxx%)%)%)%,%
%CXX,%(%else-then(%CXX%,%(%toupper(%Cxx%)%)%)%)%,%
%cxx,%(%else-then(%_Cxx%,%(%tolower(%Cxx%)%)%)%)%,%
%is_ifndef_begin,%(%else-then(%is_ifndef_begin%,%(%is_Ifndef_begin%)%)%)%,%
%ifndef_begin,%(%else-then(%if-no(%is_ifndef_begin%,,%(%ifndef_begin%)%)%,%(%if-no(%is_ifndef_begin%,,%(#ifndef %IFNDEF%_%BASE%_%EXTENSION%
#define %IFNDEF%_%BASE%_%EXTENSION%
)%)%)%)%)%,%
%Ifndef_begin,%(%else-then(%if-no(%is_ifndef_begin%,,%(%Ifndef_begin%)%)%,%(%ifndef_begin%)%)%)%,%
%IFNDEF_BEGIN,%(%else-then(%IFNDEF_BEGIN%,%(%toupper(%Ifndef_begin%)%)%)%)%,%
%ifndef_begin,%(%else-then(%_Ifndef_begin%,%(%tolower(%Ifndef_begin%)%)%)%)%,%
%is_ifndef_end,%(%else-then(%is_ifndef_end%,%(%is_Ifndef_end%)%)%)%,%
%ifndef_end,%(%else-then(%if-no(%is_ifndef_end%,,%(%ifndef_end%)%)%,%(%if-no(%is_ifndef_end%,,%(#endif %if(%H%,/*/,///)% ndef %IFNDEF%_%BASE%_%EXTENSION% %if(%H%,/*/)%
)%)%)%)%)%,%
%Ifndef_end,%(%else-then(%if-no(%is_ifndef_end%,,%(%Ifndef_end%)%)%,%(%ifndef_end%)%)%)%,%
%IFNDEF_END,%(%else-then(%IFNDEF_END%,%(%toupper(%Ifndef_end%)%)%)%)%,%
%ifndef_end,%(%else-then(%_Ifndef_end%,%(%tolower(%Ifndef_end%)%)%)%)%,%
%is_namespace_begin,%(%else-then(%is_namespace_begin%,%(%is_Namespace_begin%)%)%)%,%
%namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%namespace_begin%)%)%,%(%if-no(%is_namespace_begin%,,%(%
%%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%%
%)%)%)%)%)%,%
%Namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%Namespace_begin%)%)%,%(%namespace_begin%)%)%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_Namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%is_namespace_end,%(%else-then(%is_namespace_end%,%(%is_Namespace_end%)%)%)%,%
%namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%namespace_end%)%)%,%(%if-no(%is_namespace_end%,,%(%
%%reverse-parse(%Namespace%,/,,,,%(} /// namespace %ns%
)%,ns)%%
%)%)%)%)%)%,%
%Namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%Namespace_end%)%)%,%(%namespace_end%)%)%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_Namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%is_attached,%(%else-then(%is_attached%,%(%is_Attached%)%)%)%,%
%attached,%(%else-then(%if-no(%is_attached%,,%(%attached%)%)%,%(%if-no(%is_attached%,,%(pointer_t)%)%)%)%)%,%
%Attached,%(%else-then(%if-no(%is_attached%,,%(%Attached%)%)%,%(%attached%)%)%)%,%
%ATTACHED,%(%else-then(%ATTACHED%,%(%toupper(%Attached%)%)%)%)%,%
%attached,%(%else-then(%_Attached%,%(%tolower(%Attached%)%)%)%)%,%
%%(%
%///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-%year()% %Organization%
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
///   File: %Base%.%Extension%
///
/// Author: %Author%
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
%
%%Ifndef_begin%%
%
#include "xos/mt/%What%.hpp"
%
%%then-if(%Namespace_begin%,
)%%
%
/// class %What%t
template 
<typename TWhat = platform_%What%_t,
 typename TAttr = platform_%What%_attr_t,
 TAttr VAttrNone = platform_%What%_attr_none,
 typename TError = platform_%What%_error_t,
 TError VErrorSuccess = platform_%What%_error_success,
 TError VErrorFailed = platform_%What%_error_failed,
 TError VErrorBusy = platform_%What%_error_busy,
 TError VErrorTimeout = platform_%What%_error_timeout,
 TError VErrorInterrupted = platform_%What%_error_interrupted,
 class TExtends = mt::extended::%What%t<TWhat*>, 
 class TImplements = typename TExtends::implements>
class exported %What%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %What%t derives;
    
    typedef TWhat %What%_t;
    typedef TAttr %What%_attr_t;
    enum { %What%_attr_none = VAttrNone };
    typedef TError error_t;
    enum { error_success = VErrorSuccess,
           error_failed = VErrorFailed,
           error_busy = VErrorBusy,
           error_timeout = VErrorTimeout,
           error_interrupted = VErrorInterrupted};
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

    /// ...%Do%... / ...%Undo%...
    virtual %Do%_status timed_%Do%(mseconds_t milliseconds) {
        attached_t detached = 0;
        if ((detached = this->attached_to())) {
            return timed_%Do%_detached(detached, milliseconds);
        }
        return %Do%_failed;
    }
    virtual %Do%_status untimed_%Do%() {
        attached_t detached = 0;
        if ((detached = this->attached_to())) {
            return untimed_%Do%_detached(detached);
        }
        return %Do%_failed;
    }
    virtual %Do%_status try_%Do%() {
        attached_t detached = 0;
        if ((detached = this->attached_to())) {
            return try_%Do%_detached(detached);
        }
        return %Do%_failed;
    }
    virtual bool %Undo%() {
        attached_t detached = 0;
        if ((detached = this->attached_to())) {
            return %Undo%_detached(detached);
        }
        return false;
    }

    /// ...%Do%_detached... / ...%Undo%_detached...
    virtual bool %Do%_detached(attached_t detached) const { 
        return (%Do%_success == (untimed_%Do%_detached(detached))); 
    }
    virtual %Do%_status timed_%Do%_detached(attached_t detached, mseconds_t milliseconds) const { 
        if (0 < (milliseconds)) {
        } else {
            if (0 > (milliseconds)) {
                return untimed_%Do%_detached(detached);
            } else {
                return try_%Do%_detached(detached);
            }
        }
        return %Do%_failed; 
    }
    virtual %Do%_status try_%Do%_detached(attached_t detached) const { 
        return %Do%_failed; 
    }
    virtual %Do%_status untimed_%Do%_detached(attached_t detached) const { 
        return %Do%_failed; 
    }
    virtual bool %Undo%_detached(attached_t detached) const { 
        return false; 
    }

    /// ...create... / ...destroy...
    virtual attached_t create_attached() {
        attached_t detached = (attached_t)(unattached);
        if ((this->destroyed())) {
            if (((attached_t)(unattached) != (detached = create_detached()))) {
                this->attach(detached);
            }
        }
        return detached;
    }
    virtual attached_t create_detached() const {
        attached_t detached = (attached_t)(unattached);
        return detached;
    }
    virtual bool destroy_detached(attached_t detached) const {
        if ((attached_t)(unattached) != (detached)) {
        }
        return false;
    }
}; /// class %What%t
typedef %What%t<> %What%;
%
%%then-if(%Namespace_end%,
)%%
%%then-if(%Ifndef_end%,
)%%
%)%)%