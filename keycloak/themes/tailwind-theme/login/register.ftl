<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        <div class="mb-8">
            <!-- Brand Logo -->
            <div class="flex items-center mb-8">
                <#if realm.logo??>
                    <img src="${realm.logo}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                <#else>
                    <img src="${url.resourcesPath}/${properties.logoPath!'img/logo.png'}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                </#if>
                <span class="ml-3 text-lg font-semibold text-gray-900">${realm.displayName!}</span>
            </div>
            <div class="text-left">
                <h1 class="text-2xl font-semibold text-gray-900 mb-2">${msg("registerWelcome")}</h1>
                <p class="text-gray-600">${msg("registerMessage")}</p>
            </div>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-register" action="${url.registrationAction}" method="post">
                    <div class="space-y-6">
                        <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                            <div class="form-group">
                                <label for="firstName" class="block text-sm font-medium text-gray-700">${msg("firstName")}</label>
                                <input type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')}"
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                       aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                />
                                <#if messagesPerField.existsError('firstName')>
                                    <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <div class="form-group">
                                <label for="lastName" class="block text-sm font-medium text-gray-700">${msg("lastName")}</label>
                                <input type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')}"
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                       aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                                />
                                <#if messagesPerField.existsError('lastName')>
                                    <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="block text-sm font-medium text-gray-700">${msg("email")}</label>
                            <input type="text" id="email" name="email" value="${(register.formData.email!'')}" autocomplete="email"
                                   class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                   aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                            />
                            <#if messagesPerField.existsError('email')>
                                <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <#if !realm.registrationEmailAsUsername>
                            <div class="form-group">
                                <label for="username" class="block text-sm font-medium text-gray-700">${msg("username")}</label>
                                <input type="text" id="username" name="username" value="${(register.formData.username!'')}" autocomplete="username"
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                />
                                <#if messagesPerField.existsError('username')>
                                    <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <#if passwordRequired??>
                            <div class="form-group">
                                <label for="password" class="block text-sm font-medium text-gray-700">${msg("password")}</label>
                                <input type="password" id="password" name="password" autocomplete="new-password"
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                />
                                <#if messagesPerField.existsError('password')>
                                    <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <div class="form-group">
                                <label for="password-confirm" class="block text-sm font-medium text-gray-700">${msg("passwordConfirm")}</label>
                                <input type="password" id="password-confirm" name="password-confirm"
                                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                />
                                <#if messagesPerField.existsError('password-confirm')>
                                    <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <#if recaptchaRequired??>
                            <div class="form-group">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                            </div>
                        </#if>

                        <div class="form-group">
                            <input class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition duration-150 ease-in-out" 
                                   type="submit" value="${msg("doRegister")}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info" >
        <div id="kc-registration" class="mt-6 text-center">
            <div class="text-sm">
                <span class="text-gray-600">${msg("alreadyHaveAccount")}</span>
                <a href="${url.loginUrl}" class="font-medium text-primary-600 hover:text-primary-500 ml-1">
                    ${msg("doLogIn")}
                </a>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
