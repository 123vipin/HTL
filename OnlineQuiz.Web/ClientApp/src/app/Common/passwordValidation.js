"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var PasswordValidator = /** @class */ (function () {
    function PasswordValidator() {
    }
    PasswordValidator.validate = function (registrationFormGroup) {
        var password = registrationFormGroup.controls.password.value;
        var repeatPassword = registrationFormGroup.controls.confirmPassword.value;
        if (repeatPassword.length <= 0) {
            return null;
        }
        if (repeatPassword !== password) {
            return {
                doesMatchPassword: true
            };
        }
        return null;
    };
    return PasswordValidator;
}());
exports.PasswordValidator = PasswordValidator;
//# sourceMappingURL=passwordValidation.js.map