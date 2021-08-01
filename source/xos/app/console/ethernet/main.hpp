///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2020 $organization$
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
///   File: main.hpp
///
/// Author: $author$
///   Date: 3/8/2020
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_ETHERNET_MAIN_HPP
#define XOS_APP_CONSOLE_ETHERNET_MAIN_HPP

#include "xos/app/console/ethernet/main_opt.hpp"
#include "xos/network/ethernet/os/address.hpp"

namespace xos {
namespace app {
namespace console {
namespace ethernet {

/// class maint
template 
<class TEthernet = network::ethernet::os::address,
 class TExtends = main_opt, class TImplements = typename TExtends::implements>

class exported maint: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef maint derives;

    typedef TEthernet ethernet_t;
    typedef typename extends::string_t string_t;
    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };

    /// constructor / destructor
    maint() {
    }
    virtual ~maint() {
    }
private:
    maint(const maint& copy): extends(copy) {
    }

protected:
    /// ...run
    virtual int run(int argc, char_t** argv, char_t** env) {
        int err = 0, optind = 0, &index = this->index();
        network::ethernet::address &ethernet = this->ethernet();
        network::ethernet::actual::address *address = 0;

        if (argc > (optind = ::optind)) {
            const char_t* arg = 0;
            if ((argv) && (arg = argv[optind]) && (arg[0])) {
                index = ::atoi(arg);
            }
        }
        if ((address = ethernet.set_to_adapter(index))) {
            this->outl(ethernet.adapter_name().chars(), " ", ethernet.actual_string().chars(), null);
        }
        return err;
    }
    
    /// ...
    virtual network::ethernet::address& ethernet() const {
        static ethernet_t ethernet;
        return ethernet;
    }
    virtual int& index() const {
        static int index = 0;
        return index;
    }
}; /// class maint
typedef maint<> main;

} /// namespace ethernet
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_ETHERNET_MAIN_HPP 
