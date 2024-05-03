<?php

class CheckoutController extends BaseController
{
    protected $productModel;
    protected $cart;
    protected $orderModel;
    protected $orderDetail;
    protected $banners;
    protected $bannerModel;
    protected $couponModel;
    protected $userModel;
    protected $coupon;

    public function __construct()
    {
        $this->loadHelper('CartHelper');
        $this->cart = new CartHelper;
        $this->loadModel('ProductModel');
        $this->productModel = new ProductModel;
        $this->loadModel('OrderModel');
        $this->orderModel = new OrderModel;
        $this->loadModel('OrderDetail');
        $this->orderDetail = new OrderDetail;
        $this->loadModel('BannerModel');
        $this->bannerModel = new BannerModel;
        $this->banners = $this->bannerModel->findBannerBySite('Checkout');
        $this->loadModel('CouponModel');
        $this->couponModel = new CouponModel;
        $this->loadModel('UserModel');
        $this->userModel = new UserModel;
    }

    public function index()
    {
        $user = !empty($_SESSION['user']) ? $this->userModel->findUserById(['*'], $_SESSION['user']['id']) : null;
        $_SESSION['coupon'] = empty($_SESSION['coupon']) ? null : $_SESSION['coupon'];
        return $this->view('site.checkout.checkout', [
            'cart' => $this->cart,
            'banners' => $this->banners,
            'user' => $user
        ]);
    }

    public function process()
    {
        $data = [
            "fname" => $_POST["fname"],
            "lname" => $_POST["lname"],
            "email" => $_POST["email"],
            "phone" => $_POST["phone"],
            "province" => $_POST["province"],
            "address" => $_POST["address"],
            "note" => $_POST["note"],
            "delivery" => $_POST["delivery"],
            "payment" => $_POST["payment"],
            "account_id" => $_SESSION["user"]["id"],
            "coupon" => $_SESSION["coupon"]
        ];

        // store order
        if (!empty($this->cart)) {
            $order = $this->orderModel->store($data);
            // 2. Luu gio hang vao order detail
            foreach ($this->cart->items as $item) {
                $this->orderDetail->store([
                    'order_id' => $order["id"],
                    'product_id' => $item['id'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price_sum']
                ]);
            }
        }

        // update coupon
        $coupon = $this->couponModel->getCouponDetailById($_SESSION["coupon_id"]);
        $status = ($coupon["used_times"] == 1) ? 0 : 1;
        $used_times = $coupon["used_times"] - 1;

        $coupon_data = [
            'status' => $status,
            'used_times' => $used_times,
            'updated_at' => date("Y-m-d", time())
        ];
        $this->couponModel->updateDataAfterCheckout($coupon["id"], $coupon_data);

        // clear cart and session data
        $this->cart->clear();
        $_SESSION["coupon"] = 0;
        $_SESSION["coupon_id"] = "";

        // return view
        // return view('site.checkout.success_order', [
        //     'order'=>$this->orderModel->getOrderDetailById($order['id']),
        //     'order_detail'=>$this->orderModel->getAllProductsInOrderById($order['id'])
        // ]);
        header('location: ./?controller=customer&action=orderDetail&id=' . $order["id"]);
    }
    public function online_checkout(){
        if (isset($_POST['redirect'])){
            $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
            $vnp_Returnurl = "http://localhost/vnpay_php/vnpay_return.php";
            $vnp_TmnCode = "JF8NWUAB";//Mã website tại VNPAY 
            $vnp_HashSecret = "RSSUGGGMNLAXEATLEWGHARHNWESKCGOD"; //Chuỗi bí mật
            
            $vnp_TxnRef = random(00, 10000); //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang vnpay
            $vnp_OrderInfo = 'order info';
            $vnp_OrderType = 'bill Payment';
            $vnp_Amount = 10000* 100;
            $vnp_Locale = 'vn';
            $vnp_BankCode = 'NCB';
            $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
            //Add Params of 2.0.1 Version
            // $vnp_ExpireDate = $_POST['txtexpire'];
            // //Billing
            // $vnp_Bill_Mobile = $_POST['txt_billing_mobile'];
            // $vnp_Bill_Email = $_POST['txt_billing_email'];
            // $fullName = trim($_POST['txt_billing_fullname']);
            // if (isset($fullName) && trim($fullName) != '') {
            //     $name = explode(' ', $fullName);
            //     $vnp_Bill_FirstName = array_shift($name);
            //     $vnp_Bill_LastName = array_pop($name);
            // }
            // $vnp_Bill_Address=$_POST['txt_inv_addr1'];
            // $vnp_Bill_City=$_POST['txt_bill_city'];
            // $vnp_Bill_Country=$_POST['txt_bill_country'];
            // $vnp_Bill_State=$_POST['txt_bill_state'];
            // // Invoice
            // $vnp_Inv_Phone=$_POST['txt_inv_mobile'];
            // $vnp_Inv_Email=$_POST['txt_inv_email'];
            // $vnp_Inv_Customer=$_POST['txt_inv_customer'];
            // $vnp_Inv_Address=$_POST['txt_inv_addr1'];
            // $vnp_Inv_Company=$_POST['txt_inv_company'];
            // $vnp_Inv_Taxcode=$_POST['txt_inv_taxcode'];
            // $vnp_Inv_Type=$_POST['cbo_inv_type'];
            $inputData = array(
                "vnp_Version" => "2.1.0",
                "vnp_TmnCode" => $vnp_TmnCode,
                "vnp_Amount" => $vnp_Amount,
                "vnp_Command" => "pay",
                "vnp_CreateDate" => date('YmdHis'),
                "vnp_CurrCode" => "VND",
                "vnp_IpAddr" => $vnp_IpAddr,
                "vnp_Locale" => $vnp_Locale,
                "vnp_OrderInfo" => $vnp_OrderInfo,
                "vnp_OrderType" => $vnp_OrderType,
                "vnp_ReturnUrl" => $vnp_Returnurl,
                "vnp_TxnRef" => $vnp_TxnRef
                // "vnp_ExpireDate"=>$vnp_ExpireDate,
                // "vnp_Bill_Mobile"=>$vnp_Bill_Mobile,
                // "vnp_Bill_Email"=>$vnp_Bill_Email,
                // "vnp_Bill_FirstName"=>$vnp_Bill_FirstName,
                // "vnp_Bill_LastName"=>$vnp_Bill_LastName,
                // "vnp_Bill_Address"=>$vnp_Bill_Address,
                // "vnp_Bill_City"=>$vnp_Bill_City,
                // "vnp_Bill_Country"=>$vnp_Bill_Country,
                // "vnp_Inv_Phone"=>$vnp_Inv_Phone,
                // "vnp_Inv_Email"=>$vnp_Inv_Email,
                // "vnp_Inv_Customer"=>$vnp_Inv_Customer,
                // "vnp_Inv_Address"=>$vnp_Inv_Address,
                // "vnp_Inv_Company"=>$vnp_Inv_Company,
                // "vnp_Inv_Taxcode"=>$vnp_Inv_Taxcode,
                // "vnp_Inv_Type"=>$vnp_Inv_Type
            );
            
            if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                $inputData['vnp_BankCode'] = $vnp_BankCode;
            }
            if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
                $inputData['vnp_Bill_State'] = $vnp_Bill_State;
            }
            
            //var_dump($inputData);
            ksort($inputData);
            $query = "";
            $i = 0;
            $hashdata = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashdata .= urlencode($key) . "=" . urlencode($value);
                    $i = 1;
                }
                $query .= urlencode($key) . "=" . urlencode($value) . '&';
            }
            
            $vnp_Url = $vnp_Url . "?" . $query;
            if (isset($vnp_HashSecret)) {
                $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//  
                $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
            }
            $returnData = array('code' => '00'
                , 'message' => 'success'
                , 'data' => $vnp_Url);
                if (isset($_POST['redirect'])) {
                    header('Location: ' . $vnp_Url);
                    die();
                } else {
                    echo json_encode($returnData);
                }
                }
            }

    public function validate($data)
    {
        $isValid = false;
    }
}
