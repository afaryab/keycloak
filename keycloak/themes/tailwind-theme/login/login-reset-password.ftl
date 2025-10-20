<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        <div class="text-center">
            <h1 class="text-3xl font-bold text-gray-900 mb-2">${msg("resetPasswordWelcome")}</h1>
            <p class="text-gray-600">${msg("resetPasswordMessage")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-reset-password" action="${url.loginAction}" method="post">
                    <div class="space-y-6">
                        <div class="form-group">
                            <label for="username" class="block text-sm font-medium text-gray-700">
                                <#if !realm.loginWithEmailAllowed>
                                    ${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>
                                    ${msg("usernameOrEmail")}
                                <#else>
                                    ${msg("email")}
                                </#if>
                            </label>
                            <input type="text" id="username" name="username" autofocus value="${(auth.attemptedUsername!'')}"
                                   class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                            />
                            <#if messagesPerField.existsError('username')>
                                <span class="text-red-600 text-sm mt-1 block" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="form-group">
                            <input class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out" 
                                   type="submit" value="${msg("doSubmit")}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <div id="kc-registration" class="mt-6 text-center">
            <div class="text-sm">
                <a href="${url.loginUrl}" class="font-medium text-blue-600 hover:text-blue-500">
                    &laquo; ${msg("backToLogin")}
                </a>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
